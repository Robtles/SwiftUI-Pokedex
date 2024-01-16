//
//  SettingsNavigationView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import ComposableArchitecture
import Defaults
import SwiftUI

// MARK: - Settings Navigation View
struct SettingsNavigationView: View {
    // MARK: Environment Properties
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    let store: StoreOf<SettingsNavigationFeature>
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationStackStore(
                store.scope(state: \.path, action: \.path)
            ) {
                SettingsView(navigationStore: store)
            } destination: {
                switch $0 {
                case .sortingOrder:
                    SettingsSelectionView(
                        initialValue: defaults.sortingOrder
                    )
                case .language:
                    SettingsSelectionView(
                        initialValue: defaults.language
                    )
                }
            }
        }
    }
}

#Preview {
    SettingsNavigationView(
        store: Store(
            initialState: SettingsNavigationFeature.State()
        ) {
            SettingsNavigationFeature()
        }
    )
    .environment(Defaults.shared)
}
