//
//  PokemonFeature.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 16/01/2024.
//

import ComposableArchitecture
import Model

// MARK: Pokémon View Reducer
@Reducer
struct PokemonFeature {
    // MARK: Reducer
    struct State: Equatable {
        let names: LocalizedContentDictionary
        let pokemon: Pokemon
    }
    
    enum Action {
        case none
    }
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
