//
//  PokedexApp.swift
//  SwiftUI-Pokedex-Watch-MVVM Watch App
//
//  Created by Rob on 05/01/2024.
//

import Defaults
import Model
import Persistence
import SwiftUI

// MARK: - App
@main
struct PokedexApp: App {
    // MARK: State Properties
    @State private var appModel = AppModel()
    
    // MARK: View Properties
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(Defaults.shared)
                .environment(appModel)
                .addPersistentStores()
        }
    }
}
