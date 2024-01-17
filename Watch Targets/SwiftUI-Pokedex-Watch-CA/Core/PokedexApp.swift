//
//  SwiftUI_Pokedex_Watch_CAApp.swift
//  SwiftUI-Pokedex-Watch-CA Watch App
//
//  Created by Rob on 11/01/2024.
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
            MainView(repository: APIRepository.shared)
                .environment(Defaults.shared)
                .environment(appModel)
                .addPersistentStores()
        }
    }
}
