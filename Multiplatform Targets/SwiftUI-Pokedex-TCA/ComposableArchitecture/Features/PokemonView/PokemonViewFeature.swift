//
//  PokemonViewFeature.swift
//  SwiftUI-Pokedex-TCA
//
//  Created by Rob on 15/01/2024.
//

import ComposableArchitecture
import Foundation
import Model

// MARK: - Pokémon View Reducer
@Reducer
struct PokemonViewFeature {
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
