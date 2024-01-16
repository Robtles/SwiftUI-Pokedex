//
//  SettingsView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - Settings View
struct SettingsView: View {
    // MARK: State Properties
    let navigationStore: StoreOf<SettingsNavigationFeature>
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(navigationStore, observe: { $0 }) { viewStore in
            VStack {
                Text(Strings.SettingsView.title)
                    .font(.title3)
                Spacer()
                NavigationLink(
                    state: SettingsNavigationFeature.Path.State.language
                ) {
                    Text(Strings.SettingsView.language)
                }
                NavigationLink(
                    state: SettingsNavigationFeature.Path.State.sortingOrder
                ) {
                    Text(Strings.SettingsView.sortingOrder)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView(
        navigationStore: Store(
            initialState: SettingsNavigationFeature.State()
        ) {
            SettingsNavigationFeature()
        }
    )
}
