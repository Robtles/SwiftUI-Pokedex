//
//  PokemonListView.swift
//
//  Created by Rob on 27/11/2023.
//

import Defaults
import Mock
import Model
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
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
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
    public let pokemons: [Int: LocalizedContentDictionary]
    
    // MARK: View Properties
    public var body: some View {
        ScrollViewReader { proxy in
            List(sortedPokemons, id: \.key) {
                PokemonListRowView(
                    id: $0.key,
                    localizedNames: $0.value
                )
                .focused($focused, equals: $0.key)
                .listRowInsets(EdgeInsets())
                #if !os(tvOS)
                .listRowSeparatorTint(
                    Colors.secondaryBackground.from(defaults, colorScheme: colorScheme)
                )
                #endif
                #if os(macOS)
                // ugly workaround for macOS to remove unnecessary horizontal padding around the list rows
                .padding(.horizontal, -8.0)
                #endif
            }
            .background(
                Colors.primaryBackground.from(defaults, colorScheme: colorScheme)
            )
            .listStyle(PlainListStyle())
            #if os(tvOS)
            .onMoveCommand(perform: handleMoveCommand(proxy: proxy))
            #endif
        }
    }
    
    // MARK: Init Methods
    public init(pokemons: [Int: LocalizedContentDictionary]) {
        self.pokemons = pokemons
    }
    
    // MARK: View Methods
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
                    .preview(in: $0, displayMode: .light)
                PokemonListView(pokemons: firstLocalizedPokemons)
                    .preview(in: $0, displayMode: .dark)
            }
        }
    }
}
