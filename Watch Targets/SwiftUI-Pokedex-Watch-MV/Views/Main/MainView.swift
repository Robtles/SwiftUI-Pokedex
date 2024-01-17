//
//  MainView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import API
import Error
import Model
import Persistence
import SwiftUI
import UI
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
        PersistenceContentView { persistenceContent in
            PokedexNavigationView(
                pokemons: persistenceContent.pokemonNames
            )
        } loadingView: { modelContext in
            LoadingView()
                .task {
                    do {
                        let pokemons = try await loadData()
                        modelContext.insert(
                            PersistenceContent(
                                pokemonNames: pokemons
                            )
                        )
                    } catch {}
                }
        }
    }
    
    // MARK: Methods
    /// Loads the required data: game versions and Pokémon list
    private func loadData() async throws -> LocalizedIndexedContentDictionary {
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
        return dataContent.pokemons
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
