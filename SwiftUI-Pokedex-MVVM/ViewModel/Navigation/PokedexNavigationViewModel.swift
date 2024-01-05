//
//  PokedexNavigationViewModel.swift
//  SwiftUI-Pokedex-MVVM
//
//  Created by Rob on 05/01/2024.
//

import Model
import Navigation
import SwiftUI

// MARK: - Pokédex Navigation View Model
@Observable class PokedexNavigationViewModel {
    // MARK: Properties
    /// The Pokémon list
    let pokemons: LocalizedIndexedContentDictionary
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        self.pokemons = pokemons
    }
    
    // MARK: Navigation Methods
    func goToSettings() {
        Navigation.shared.go(to: .settings)
    }
}
