//
//  PokedexApp.swift
//  SwiftUI-Pokedex
//
//  Created by Rob on 26/10/2023.
//

import API
import Defaults
import Error
import Mock
import Model
import Navigation
import SwiftUI
import UI

// MARK: - App
@main
struct PokedexApp: App {
    // MARK: State Properties
    @State private var appModel = AppModel()

    // MARK: View Properties
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(ErrorManager.shared)
                .environment(Defaults.shared)
                .environment(Navigation.shared)
                .environment(appModel)
        }
    }

    // MARK: Init Methods
    init() {
        Style.apply()
    }
}
