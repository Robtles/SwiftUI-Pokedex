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
    // MARK: Instance Properties
    private let pokemons: LocalizedIndexedContentDictionary
    private let repository: Repository
    
    // MARK: State Properties
    @State private var currentTab: Tab = .pokedexList
    
    // MARK: View Properties
    var body: some View {
        TabView(selection: $currentTab) {
            SettingsNavigationView()
                .tag(Tab.settings)
            PokedexListView(
                pokemons: pokemons,
                repository: repository
            )
            .tag(Tab.pokedexList)
        }
        .tabViewStyle(.verticalPage)
    }
    
    // MARK: Init Methods
    init(
        pokemons: LocalizedIndexedContentDictionary,
        repository: Repository
    ) {
        self.pokemons = pokemons
        self.repository = repository
    }
}

#Preview {
    PokedexNavigationView(
        pokemons: firstLocalizedPokemons,
        repository: APIRepository.shared
    )
    .environment(Defaults.shared)
}
