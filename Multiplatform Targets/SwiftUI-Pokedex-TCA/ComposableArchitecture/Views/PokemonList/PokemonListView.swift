//
//  PokemonListView.swift
//
//  Created by Rob on 27/11/2023.
//

import API
import ComposableArchitecture
import Defaults
import Mock
import Model
import Persistence
import SwiftData
import SwiftUI
import UI

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

    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    @Environment(\.modelContext) private var modelContext
    
    // MARK: Query Properties
    @Query private var content: [PersistenceContent]
    
    // MARK: Computed Properties
    private func sortedPokemons(from pokemons: LocalizedIndexedContentDictionary) -> [PokemonListViewContent] {
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
    let store: StoreOf<PokemonListFeature>
    
    // MARK: View Properties
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                ScrollViewReader { proxy in
                    List(sortedPokemons(from: viewStore.pokemonNames), id: \.key) { pokemon in
                        internalRow(pokemon, store: viewStore)
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
                if viewStore.loading {
                    PokemonListLoadingView()
                }
            }
        }
        .sheet(
            store: store.scope(
                state: \.$destination,
                action: { .destination($0) }
            ),
            state: \.pokemon,
            action: {
                .pokemon($0)
            }
        ) { pokemonSheetStore in
            WithViewStore(pokemonSheetStore, observe: { $0 }) { pokemonSheetViewStore in
                PokemonSheetView(
                    names: pokemonSheetViewStore.names,
                    pokemon: pokemonSheetViewStore.pokemon
                )
            }
        }
    }
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        self.store = Store(
            initialState: PokemonListFeature.State(
                pokemonNames: pokemons
            )
        ) {
            PokemonListFeature()
        }
    }
    
    // MARK: View Methods
    @ViewBuilder private func internalRow(
        _ pokemon: PokemonListViewContent,
        store: ViewStoreOf<PokemonListFeature>
    ) -> some View {
        #if os(tvOS)
        Button {
            store.send(.displayPokemon(id: pokemon.key))
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
            store.send(
                .displayPokemon(
                    id: pokemon.key,
                    modelContext: modelContext,
                    content: content
                )
            )
        }
        #if !os(watchOS)
        .listRowSeparatorTint(
            Colors.secondaryBackground.from(defaults, colorScheme: colorScheme)
        )
        #endif
        #if os(macOS)
        // ugly workaround for macOS to remove unnecessary horizontal padding around the list rows
        .padding(.horizontal, -8.0)
        #endif
        #endif
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
                    .preview(in: $0, displayMode: .light)
                PokemonListView(pokemons: firstLocalizedPokemons)
                    .environment(AppModel())
                    .preview(in: $0, displayMode: .dark)
            }
        }
    }
}
