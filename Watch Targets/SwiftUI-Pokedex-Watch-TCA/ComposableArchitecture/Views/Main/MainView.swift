//
//  MainView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import API
import ComposableArchitecture
import Error
import Model
import SwiftUI
import UI
import WatchAPI

// MARK: - Main View
struct MainView: View {
    // MARK: State Properties
    let store: StoreOf<MainFeature>
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                if viewStore.loading {
                    LoadingView()
                        .task {
                            viewStore.send(.fetchData)
                        }
                } else {
                    PokedexNavigationView(
                        pokemons: viewStore.pokemonNames
                    )
                }
            }
        }
    }
}
