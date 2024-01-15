//
//  SwiftUI_Pokedex_TCAApp.swift
//  SwiftUI-Pokedex-TCA
//
//  Created by Rob on 12/01/2024.
//

import ComposableArchitecture
import Defaults
import SwiftUI
import UI

// MARK: - App
@main
struct PokedexApp: App {
    let store = Store(
        initialState: MainFeature.State()
    ) {
        MainFeature()
        #if DEBUG
            ._printChanges()
        #endif
    }

    // MARK: View Properties
    var body: some Scene {
        WindowGroup {
            MainView(store: store)
                .environment(Defaults.shared)
        }
    }

    // MARK: Init Methods
    init() {
        Style.apply()
    }
}
