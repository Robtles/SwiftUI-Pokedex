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
    // MARK: Internal Types
    /// Represents the data expected to get from the base API call
    private struct DataContent {
        let pokemons: [Int: LocalizedContentDictionary]
        let versions: [Version]
    }
    
    // MARK: Environment Properties
    /// The app model, containing shared data
    @Environment(PokedexAppModel.self) private var appModel
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    /// The error manager
    @Environment(ErrorManager.self) private var errorManager
    
    // MARK: State Properties
    /// If the view is in a loading state
    @State private var loading: Bool = true
    /// The loaded Pokémon list
    @State private var pokemons: [Int: LocalizedContentDictionary] = [:]
    
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
                PokedexNavigationView(with: pokemons)
            }
        }
        .modifier(
            ErrorPopupModifier(
                errorMessage: errorManager.currentErrorMessage
            )
        )
    }
    
    // MARK: Methods
    /// Loads the required data: game versions and Pokémon list
    private func loadData() async throws {
        let dataContent = try await withThrowingTaskGroup(of: DataContent.self) { _ in
            let pokemons = try await API.shared.getAllPokemons()
            let versions = try await API.shared.getAllVersions()
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

struct PokemonListRowViewPreview: PreviewProvider {
    @State private static var appModel = PokedexAppModel()
    
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                MainView()
                    .preview(in: platform, displayMode: .light)
                MainView()
                    .preview(in: platform, displayMode: .dark)
            }
        }
        .environment(appModel)
        .environment(Navigation.shared)
    }
}
