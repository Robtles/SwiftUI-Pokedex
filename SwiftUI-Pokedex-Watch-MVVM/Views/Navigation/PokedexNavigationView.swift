//
//  PokedexNavigationView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Defaults
import Mock
import Model
import SwiftUI

enum Tab {
    case pokedexList
    case settings
}

// MARK: - Navigation View
struct PokedexNavigationView: View {
    // MARK: State Properties
    @State private var viewModel: PokedexNavigationViewModel
    
    // MARK: View Properties
    var body: some View {
        TabView(selection: $viewModel.currentTab) {
            SettingsNavigationView()
                .tag(Tab.settings)
            PokedexListView(pokemons: viewModel.pokemons)
                .tag(Tab.pokedexList)
        }
        .tabViewStyle(.verticalPage)
    }
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        _viewModel = State(
            initialValue: PokedexNavigationViewModel(pokemons: pokemons)
        )
    }
}

#Preview {
    PokedexNavigationView(pokemons: firstLocalizedPokemons)
        .environment(Defaults.shared)
}
