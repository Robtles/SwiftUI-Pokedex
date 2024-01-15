//
//  PokedexNavigationFeature.swift
//  SwiftUI-Pokedex-TCA
//
//  Created by Rob on 15/01/2024.
//

import API
import ComposableArchitecture
import Defaults
import Model

// MARK: - Pokédex Navigation Reducer
@Reducer
struct PokedexNavigationFeature {
    // MARK: Reducer
    struct State: Equatable {
        /// The navigation path
        var path = StackState<Path.State>()
        /// The loaded Pokémon names list
        var pokemonNames: LocalizedIndexedContentDictionary
        
        // MARK: Init Methods
        init(pokemonNames: LocalizedIndexedContentDictionary) {
            self.pokemonNames = pokemonNames
        }
    }
    
    enum Action {
        case path(StackAction<Path.State, Path.Action>)
        case pop
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .pop:
                state.path.removeLast()
                return .none
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}

extension PokedexNavigationFeature {
    @Reducer
    struct Path {
        enum State: Equatable {
            /// The settings view
            case settings
            #if os(tvOS)
            /// The settings selection view (this one is specific to tvOS)
            case settingsSelection(any DefaultsEnum)
            #endif
            
            static func == (lhs: PokedexNavigationFeature.Path.State, rhs: PokedexNavigationFeature.Path.State) -> Bool {
                return true
            }
        }
        
        enum Action {}
        
        var body: some Reducer<State, Action> {
            Scope(state: \.never, action: \.never) {}
        }
    }
}
