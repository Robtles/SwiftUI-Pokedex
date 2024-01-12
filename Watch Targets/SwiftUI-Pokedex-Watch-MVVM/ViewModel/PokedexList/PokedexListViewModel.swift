//
//  PokedexListViewModel.swift
//  SwiftUI-Pokedex-Watch-MVVM
//
//  Created by Rob on 05/01/2024.
//

import API
import Defaults
import Model
import SwiftUI

// MARK: - Pokédex List View Model
@Observable class PokedexListViewModel {
    // MARK: State Properties
    let pokemons: LocalizedIndexedContentDictionary
    
    // MARK: Internal Properties
    private var defaults: Defaults?
    
    // MARK: Computed Properties
    var sortedPokemons: [PokedexListView.Content] {
        return pokemons
            .map { (key: $0.key, value: $0.value) }
            .sorted {
                guard let defaults else { return false }
                let lName = $0.value[defaults.language] ?? ""
                let rName = $1.value[defaults.language] ?? ""
                return switch defaults.sortingOrder {
                case .byIndex: $0.key < $1.key
                case .byName: lName < rName
                }
            }
    }
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        self.pokemons = pokemons
    }
    
    // MARK: Methods
    func setup(defaults: Defaults) {
        self.defaults = defaults
    }
}
