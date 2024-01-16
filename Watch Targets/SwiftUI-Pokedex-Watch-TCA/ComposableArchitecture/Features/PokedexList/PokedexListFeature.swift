//
//  PokedexListFeature.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 15/01/2024.
//

import ComposableArchitecture
import Model

// MARK: - Pokédex List Reducer
@Reducer
struct PokedexListFeature {
    // MARK: Reducer
    struct State: Equatable {
        var pokemons: LocalizedIndexedContentDictionary = [:]
    }
    
    enum Action {}
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
