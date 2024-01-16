//
//  SettingsNavigationFeature.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 16/01/2024.
//

import ComposableArchitecture
import Foundation

// MARK: - Settings Navigation Reducer
@Reducer
struct SettingsNavigationFeature {
    // MARK: Reducer
    struct State: Equatable {
        /// The navigation path
        var path = StackState<Path.State>()
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

extension SettingsNavigationFeature {
    @Reducer
    struct Path {
        enum State: Equatable {
            case language
            case sortingOrder
        }
        
        enum Action {}
        
        var body: some ReducerOf<Self> {
            Scope(state: \.never, action: \.never) {}
        }
    }
}
