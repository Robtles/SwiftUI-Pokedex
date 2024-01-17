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
import Persistence
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
    
    // MARK: State Properties
    @State private var viewModel = MainViewModel()
    
    // MARK: View Properties
    var body: some View {
        PersistenceContentView { persistenceContent in
            PokedexNavigationView(
                with: persistenceContent.pokemonNames
            )
        } loadingView: { modelContext in
            LoadingView()
                .ignoresSafeArea()
                .task {
                    do {
                        let pokemons = try await viewModel.loadData()
                        modelContext.insert(
                            PersistenceContent(
                                pokemonNames: pokemons
                            )
                        )
                    } catch {
                        errorManager.display(error.localizedDescription)
                    }
                }
        }
        .modifier(
            ErrorPopupModifier(
                errorMessage: errorManager.currentErrorMessage
            )
        )
        .onAppear {
            viewModel.setup(appModel)
        }
    }
}
