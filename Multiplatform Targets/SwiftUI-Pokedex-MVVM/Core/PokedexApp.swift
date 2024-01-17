//
//  SwiftUI_Pokedex_MVVMApp.swift
//  PokedexApp
//
//  Created by Rob on 05/01/2024.
//

import API
import Defaults
import Error
import Mock
import Model
import Navigation
import Persistence
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
                .addPersistentStores()
        }
    }

    // MARK: Init Methods
    init() {
        Style.apply()
    }
}
