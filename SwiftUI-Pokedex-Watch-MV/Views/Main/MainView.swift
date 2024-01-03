//
//  MainView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import API
import Error
import Model
import SwiftUI
import WatchAPI

// MARK: - Main View
struct MainView: View {
    // MARK: Environment Properties
    /// The app model, containing shared data
    @Environment(AppModel.self) private var appModel
    
    // MARK: State Properties
    /// If the view is in a loading state
    @State private var loading: Bool = true
    /// The loaded Pokémon list
    @State private var pokemons: LocalizedIndexedContentDictionary = [:]
    
    // MARK: View Properties
    var body: some View {
        ZStack {
            if loading {
                LoadingView()
                    .task {
                        do {
                            try await loadData()
                        } catch {}
                    }
            } else {
                PokedexNavigationView(
                    pokemons: pokemons
                )
            }
        }
    }
    
    // MARK: Methods
    /// Loads the required data: game versions and Pokémon list
    private func loadData() async throws {
        let dataContent = try await withThrowingTaskGroup(of: DataContent.self) { _ in
            let pokemons = try await WatchAPI.shared.getAllPokemons()
            let versions = try await WatchAPI.shared.getAllVersions()
            return DataContent(
                pokemons: pokemons,
                versions: versions
            )
        }
        appModel.versions = dataContent.versions
        pokemons = dataContent.pokemons
        loading = false        
    }
}

struct MainViewPreview: PreviewProvider {
    @State private static var appModel = AppModel()
    
    static var previews: some View {
        MainView()
            .environment(appModel)
            .environment(ErrorManager.shared)
    }
}
