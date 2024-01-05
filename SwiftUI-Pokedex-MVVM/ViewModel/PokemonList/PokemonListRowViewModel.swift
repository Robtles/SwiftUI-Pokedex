//
//  PokemonListRowViewModel.swift
//  SwiftUI-Pokedex-MVVM
//
//  Created by Rob on 05/01/2024.
//

import Model
import SwiftUI

// MARK: - Pokédex List Row View Model
@Observable class PokemonListRowViewModel {
    // MARK: State Properties
    /// The Pokémon id
    let id: Int
    /// The Pokémon localized names
    let localizedNames: LocalizedContentDictionary
    
    // MARK: Init Methods
    init(id: Int, localizedNames: LocalizedContentDictionary) {
        self.id = id
        self.localizedNames = localizedNames
    }
}
