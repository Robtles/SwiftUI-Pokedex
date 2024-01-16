//
//  SettingsSelectionFeature.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 16/01/2024.
//

import ComposableArchitecture
import Defaults
import Foundation
import Model

// MARK: - SettingsSelectionFeature
@Reducer
struct SettingsSelectionFeature<T> where T: DefaultsEnum {
    struct State: Equatable {
        var initialValue: T
    }
    
    enum Action {
        case select(_ value: T, defaults: Defaults)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .select(let value, let defaults):
                switch value {
                case let language as Language:
                    defaults.language = language
                    return .none
                case let sortingOrder as SortingOrder:
                    defaults.sortingOrder = sortingOrder
                    return .none
                default:
                    return .none
                }
            }
        }
    }
}
