//
//  PokemonListView.swift
//
//  Created by Rob on 27/11/2023.
//

import API
import Defaults
import Error
import Mock
import Model
import Navigation
import SwiftUI

// MARK: - Pokemon List View
/// The initial Pokémon list view
public struct PokemonListView: View {
    // MARK: Static Properties
    private enum Constants {
        fileprivate static let advanceThreshold = 50
    }
    
    // MARK: Type Properties
    private typealias PokemonListViewContent = (key: Int, value: LocalizedContentDictionary)
    
    // MARK: State Properties
    @FocusState private var focused: Int?
    @State private var loading: Bool = false
    
    // MARK: Environment Properties
    @Environment(AppModel.self) fileprivate var appModel
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    @Environment(ErrorManager.self) private var errorManager
    
    // MARK: Computed Properties
    private var sortedPokemons: [PokemonListViewContent] {
        return pokemons
            .map { (key: $0.key, value: $0.value) }
            .sorted {
                let lName = $0.value[defaults.language] ?? ""
                let rName = $1.value[defaults.language] ?? ""
                return switch defaults.sortingOrder {
                case .byIndex: $0.key < $1.key
                case .byName: lName < rName
                }
            }
    }
    
    // MARK: Properties
    public let pokemons: LocalizedIndexedContentDictionary
    
    // MARK: View Properties
    public var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                List(sortedPokemons, id: \.key) { pokemon in
                    internalRow(pokemon)
                        .focused($focused, equals: pokemon.key)
                        .listRowInsets(EdgeInsets())
                }
                .background(
                    Colors.primaryBackground.from(defaults, colorScheme: colorScheme)
                )
                .listStyle(PlainListStyle())
                #if os(tvOS)
                .onMoveCommand(perform: handleMoveCommand(proxy: proxy))
                #endif
            }
            if loading {
                PokemonListLoadingView()
            }
        }
    }
    
    // MARK: Init Methods
    public init(pokemons: LocalizedIndexedContentDictionary) {
        self.pokemons = pokemons
    }
    
    // MARK: View Methods
    @ViewBuilder private func internalRow(
        _ pokemon: PokemonListViewContent
    ) -> some View {
        #if os(tvOS)
        Button {
            displayPokemon(id: pokemon.key)
        } label: {
            PokemonListRowView(
                id: pokemon.key,
                localizedNames: pokemon.value
            )
        }
        #else
        PokemonListRowView(
            id: pokemon.key,
            localizedNames: pokemon.value
        )
        .onTapGesture {
            displayPokemon(id: pokemon.key)
        }
        .listRowSeparatorTint(
            Colors.secondaryBackground.from(defaults, colorScheme: colorScheme)
        )
        #if os(macOS)
        // ugly workaround for macOS to remove unnecessary horizontal padding around the list rows
        .padding(.horizontal, -8.0)
        #endif
        #endif
    }
    
    private func displayPokemon(id: Int) {
        Task {
            do {
                loading = true
                let pokemon = try await API.shared.getPokemonInformation(id: id)
                loading = false
                appModel.pokemons[id] = pokemon
                Navigation.shared.showPokemon(
                    id: id,
                    nameInformation: pokemons[id] ?? [:]
                )
            } catch {
                errorManager.display(error.localizedDescription)
            }
        }
    }
    
    #if os(tvOS)
    private enum ListAdvanceDirection {
        case up, down
    }
    
    private func handleMoveCommand(proxy: ScrollViewProxy) -> (MoveCommandDirection) -> Void {
        return { direction in
            switch direction {
            case .left:
                advanceInList(.up, proxy)
            case .right:
                advanceInList(.down, proxy)
            default:
                return
            }
        }
    }
    
    private func advanceInList(
        _ direction: ListAdvanceDirection, 
        _ proxy: ScrollViewProxy
    ) {
        withAnimation {
            let newFocus = switch direction {
            case .down: min(Pokemon.Constants.maximumId, (focused ?? Pokemon.Constants.minimumId) + Constants.advanceThreshold)
            case .up: max(Pokemon.Constants.minimumId, (focused ?? Pokemon.Constants.minimumId) - Constants.advanceThreshold)
            }
            focused = newFocus
            proxy.scrollTo(newFocus, anchor: .top)
        }
    }
    #endif
}

struct PokemonListViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) {
                PokemonListView(pokemons: firstLocalizedPokemons)
                    .environment(AppModel())
                    .environment(ErrorManager.shared)
                    .preview(in: $0, displayMode: .light)
                PokemonListView(pokemons: firstLocalizedPokemons)
                    .environment(AppModel())
                    .environment(ErrorManager.shared)
                    .preview(in: $0, displayMode: .dark)
            }
        }
    }
}
