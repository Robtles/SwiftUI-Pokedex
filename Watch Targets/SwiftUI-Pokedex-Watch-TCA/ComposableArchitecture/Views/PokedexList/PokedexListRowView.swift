//
//  PokedexListRowView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import API
import ComposableArchitecture
import Defaults
import Kingfisher
import Mock
import Model
import UI
import SwiftUI

// MARK: - Pokemon List Row View
struct PokedexListRowView: View {
    // MARK: Environment Properties
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    let store: StoreOf<PokedexListRowFeature>
    
    // MARK: Type Properties
    enum Constants {
        fileprivate static let emptyPokemonName = "--"
        fileprivate static let numberPrefix = "#"
        fileprivate static let spacing = 8.0
    }
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Button {
                viewStore.send(
                    .displayPokemon(
                        id: viewStore.rowContent.key
                    )
                )
            } label: {
                HStack(spacing: 0.0) {
                    ClippedImageView(
                        url: URLBuilder.shared.url(
                            for: .pokedexListImage,
                            pokemonId: viewStore.rowContent.key
                        )
                    )
                    .frame(height: 40.0)
                    Text(viewStore.rowContent.value[defaults.language] ?? Constants.emptyPokemonName)
                        .font(.body)
                        .fontWeight(.light)
                    Spacer()
                }
            }
            .frame(height: 50.0)
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
                    PokemonView(
                        store: Store(
                            initialState: PokemonFeature.State(
                                names: pokemonSheetViewStore.names,
                                pokemon: pokemonSheetViewStore.pokemon
                            )
                        ) {
                            PokemonFeature()
                        }
                    )
                }
            }
        }
    }
}
