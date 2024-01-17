//
//  MainView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 29/11/2023.
//

import ComposableArchitecture
import Defaults
import Model
import Persistence
import SwiftUI
import UI

// MARK: - App Main View
/// The main view on which the user lands when launching the app
struct MainView: View {    
    // MARK: Environment Properties
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    let store: StoreOf<MainFeature>
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            PersistenceContentView { persistenceContent in
                PokedexNavigationView(
                    store: Store(
                        initialState: PokedexNavigationFeature.State(
                            pokemonNames: persistenceContent.pokemonNames
                        )
                    ) {
                        PokedexNavigationFeature()
                    }
                )
                .onAppear { print("1") }
            } loadingView: { modelContext in
                if viewStore.loading {
                    LoadingView()
                        .ignoresSafeArea()
                        .task {
                            viewStore.send(.fetchData(modelContext))
                        }
                } else {
                    PokedexNavigationView(
                        store: Store(
                            initialState: PokedexNavigationFeature.State(
                                pokemonNames: viewStore.pokemonNames
                            )
                        ) {
                            PokedexNavigationFeature()
                        }
                    )
                }
            }
            .modifier(
                ErrorPopupModifier(
                    errorMessage: viewStore.error.errorMessage
                )
            )
        }
    }
    
    // MARK: Init Methods
    init(store: StoreOf<MainFeature>) {
        self.store = store
    }
}
