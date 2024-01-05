//
//  PokedexNavigationViewModel.swift
//  SwiftUI-Pokedex-Watch-MVVM
//
//  Created by Rob on 05/01/2024.
//

import Model
import SwiftUI

// MARK: - Pokédex Navigation View Model
@Observable class PokedexNavigationViewModel {
    // MARK: State Properties
    var currentTab: Tab = .pokedexList
    let pokemons: LocalizedIndexedContentDictionary
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        self.pokemons = pokemons
    }
}
