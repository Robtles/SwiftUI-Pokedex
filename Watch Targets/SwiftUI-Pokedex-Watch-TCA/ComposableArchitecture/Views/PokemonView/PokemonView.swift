//
//  PokemonView.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 16/01/2024.
//

import ComposableArchitecture
import Defaults
import Mock
import SwiftUI
import UI

// MARK: - Pokémon View
struct PokemonView: View {
    // MARK: State Properties
    let store: StoreOf<PokemonFeature>
    
    // MARK: Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            UI.PokemonView(
                names: viewStore.names,
                pokemon: viewStore.pokemon
            )
        }
    }
}

#Preview {
    PokemonView(
        store: Store(
            initialState: PokemonFeature.State(
                names: pikachuLocalizedNames,
                pokemon: pikachuPokemon
            )
        ) {
            PokemonFeature()
        }
    )
    .environment(Defaults.shared)
}
