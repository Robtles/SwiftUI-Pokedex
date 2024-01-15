//
//  ErrorFeature.swift
//  SwiftUI-Pokedex-TCA
//
//  Created by Rob on 15/01/2024.
//

import ComposableArchitecture
import Model

// MARK: - Error Feature Reducer
@Reducer
struct ErrorFeature {
    // MARK: Reducer
    struct State: Equatable {
        /// An optional error message
        var errorMessage: String?
    }
    
    enum Action {
        case displayErrorMessage(String)
        case hideErrorMessage
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .displayErrorMessage(let errorMessage):
                state.errorMessage = errorMessage
                return .run { send in
                    try await Task.sleep(for: .seconds(2))
                    await send(.hideErrorMessage)
                }
            case .hideErrorMessage:
                state.errorMessage = nil
                return .none
            }
        }
    }
}
