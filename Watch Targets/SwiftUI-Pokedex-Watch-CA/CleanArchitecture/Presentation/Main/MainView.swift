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
    
    // MARK: Instance Properties
    private let repository: Repository
    
    // MARK: State Properties
    /// If the view is in a loading state
    @State private var loading: Bool = true
    /// The loaded Pokémon list
    @State private var pokemons: LocalizedIndexedContentDictionary = [:]
    
    // MARK: View Properties
    var body: some View {
        PersistenceContentView { persistenceContent in
            PokedexNavigationView(
                pokemons: persistenceContent.pokemonNames,
                repository: repository
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
    
    // MARK: Init Methods
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: Methods
    /// Loads the required data: game versions and Pokémon list
    private func loadData() async throws -> LocalizedIndexedContentDictionary {
        let dataContent = try await repository.fetchPokemonList()
        appModel.versions = dataContent.versions
        pokemons = dataContent.pokemons
        loading = false
        return dataContent.pokemons
    }
}

struct MainViewPreview: PreviewProvider {
    @State private static var appModel = AppModel()
    
    static var previews: some View {
        MainView(repository: APIRepository.shared)
            .environment(appModel)
            .environment(ErrorManager.shared)
    }
}
