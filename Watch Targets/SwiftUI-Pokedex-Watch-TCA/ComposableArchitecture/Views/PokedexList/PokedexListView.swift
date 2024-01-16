//
//  PokedexListView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import ComposableArchitecture
import Defaults
import Mock
import Model
import SwiftUI

// MARK: Type Properties
typealias PokemonListViewContent = (key: Int, value: LocalizedContentDictionary)

// MARK: - Pokédex List View
struct PokedexListView: View {
    // MARK: Environment Properties
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    let store: StoreOf<PokedexListFeature>
    
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
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            List(sortedPokemons(from: viewStore.pokemons), id: \.key) {
                PokedexListRowView(
                    store: Store(
                        initialState: PokedexListRowFeature.State(
                            pokemonNames: viewStore.pokemons,
                            rowContent: $0
                        )
                    ) {
                        PokedexListRowFeature()
                    }
                )
            }
        }
    }
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        store = Store(
            initialState: PokedexListFeature.State(
                pokemons: pokemons
            )
        ) {
            PokedexListFeature()
        }
    }
}

#Preview {
    PokedexListView(pokemons: firstLocalizedPokemons)
        .environment(Defaults.shared)
}
