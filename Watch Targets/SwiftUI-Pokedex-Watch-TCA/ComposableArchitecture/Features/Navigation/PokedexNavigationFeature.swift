//
//  PokedexNavigationFeature.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 15/01/2024.
//

import ComposableArchitecture
import Model

// MARK: - Pokédex Navigation Feature
enum Tab {
    case pokedexList
    case settings
}

@Reducer
struct PokedexNavigationFeature {
    // MARK: Reducer
    struct State: Equatable {
        var currentTab = Tab.pokedexList
        var pokemons: LocalizedIndexedContentDictionary = [:]
    }
    
    enum Action {
        case update(tab: Tab)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .update(let tab):
                state.currentTab = tab
                return .none
            }
        }
    }
}
