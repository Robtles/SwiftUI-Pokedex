//
//  PokedexApp.swift
//  SwiftUI-Pokedex-CA
//
//  Created by Rob on 11/01/2024.
//

import API
import Defaults
import Error
import Mock
import Model
import Navigation
import SwiftUI
import SwiftData
import UI

// MARK: - App
@main
struct PokedexApp: App {
    // MARK: State Properties
    @State private var appModel = AppModel()

    // MARK: View Properties
    var body: some Scene {
        WindowGroup {
            MainView(repository: APIRepository.shared)
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
