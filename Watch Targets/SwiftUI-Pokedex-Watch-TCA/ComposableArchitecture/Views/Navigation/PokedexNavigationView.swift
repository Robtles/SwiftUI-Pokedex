//
//  PokedexNavigationView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import ComposableArchitecture
import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Navigation View
struct PokedexNavigationView: View {
    // MARK: State Properties
    let store: StoreOf<PokedexNavigationFeature>
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            TabView(
                selection: Binding(get: {
                    viewStore.currentTab
                }, set: {
                    viewStore.send(.update(tab: $0))
                })
            ) {
                SettingsNavigationView(
                    store: Store(
                        initialState: SettingsNavigationFeature.State()
                    ) {
                        SettingsNavigationFeature()
                    }
                )
                .tag(Tab.settings)
                PokedexListView(
                    pokemons: viewStore.pokemons
                )
                .tag(Tab.pokedexList)
            }
            .tabViewStyle(.verticalPage)
        }
    }
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        store = Store(
            initialState: PokedexNavigationFeature.State(
                pokemons: pokemons
            )
        ) {
            PokedexNavigationFeature()
        }
    }
}

#Preview {
    PokedexNavigationView(pokemons: firstLocalizedPokemons)
        .environment(Defaults.shared)
}
