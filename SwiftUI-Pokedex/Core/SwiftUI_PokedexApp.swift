//
//  SwiftUI_PokedexApp.swift
//  SwiftUI-Pokedex
//
//  Created by Rob on 26/10/2023.
//

import API
import Defaults
import Mock
import Navigation
import SwiftUI
import SwiftData
import UI

@main
struct SwiftUI_PokedexApp: App {
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

    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
//        .modelContainer(sharedModelContainer)
    }
}
