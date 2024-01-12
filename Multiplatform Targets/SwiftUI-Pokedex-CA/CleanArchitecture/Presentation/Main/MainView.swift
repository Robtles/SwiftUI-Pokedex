//
//  MainView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 29/11/2023.
//

import API
import Defaults
import Error
import Model
import Navigation
import SwiftUI
import UI

// MARK: - App Main View
/// The main view on which the user lands when launching the app
struct MainView: View {    
    // MARK: Environment Properties
    /// The app model, containing shared data
    @Environment(AppModel.self) private var appModel
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    /// The error manager
    @Environment(ErrorManager.self) private var errorManager
    
    // MARK: Instance Properties
    private let repository: Repository
    
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
                    .ignoresSafeArea()
                    .task {
                        do {
                            try await loadData()
                        } catch {
                            errorManager.display(error.localizedDescription)
                        }
                    }
            } else {
                PokedexNavigationView(
                    with: pokemons,
                    repository: repository
                )
            }
        }
        .modifier(
            ErrorPopupModifier(
                errorMessage: errorManager.currentErrorMessage
            )
        )
    }
    
    // MARK: Init Methods
    init(repository: Repository) {
        self.repository = repository
    }
    
    // MARK: Methods
    /// Loads the required data: game versions and Pokémon list
    private func loadData() async throws {
        let dataContent = try await repository.fetchPokemonList()
        appModel.versions = dataContent.versions
        pokemons = dataContent.pokemons
        loading = false
    }
}
