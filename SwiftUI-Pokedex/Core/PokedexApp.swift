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
import SwiftData
import UI

// MARK: - App
@main
struct PokedexApp: App {
    // MARK: State Properties
    @State private var appModel = PokedexAppModel()
    
    // MARK: TEMP
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    // MARK: View Properties
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(ErrorManager.shared)
                .environment(Defaults.shared)
                .environment(Navigation.shared)
                .environment(appModel)
        }
//        .modelContainer(sharedModelContainer)
    }

    // MARK: Init Methods
    init() {
        Style.apply()
    }
}
