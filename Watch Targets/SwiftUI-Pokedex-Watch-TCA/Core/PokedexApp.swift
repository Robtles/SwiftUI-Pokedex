//
//  PokedexApp.swift
//  SwiftUI-Pokedex-Watch-TCA Watch App
//
//  Created by Rob on 12/01/2024.
//

import ComposableArchitecture
import Defaults
import Model
import SwiftUI

// MARK: - App
@main
struct PokedexApp: App {
    // MARK: State Properties
    let store = Store(
        initialState: MainFeature.State()
    ) {
        MainFeature()
    }
    
    // MARK: View Properties
    var body: some Scene {
        WindowGroup {
            MainView(store: store)
                .environment(Defaults.shared)
        }
    }
}
