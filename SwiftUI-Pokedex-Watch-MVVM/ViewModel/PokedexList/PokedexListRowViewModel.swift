//
//  PokedexListRowViewModel.swift
//  SwiftUI-Pokedex-Watch-MVVM
//
//  Created by Rob on 05/01/2024.
//

import API
import Model
import SwiftUI

// MARK: - Pokédex List Row View Model
@Observable class PokemonListRowViewModel {
    // MARK: State Properties
    var currentSheetDestination: SheetDestination?
    var rowContent: PokedexListView.Content
    
    // MARK: Init Methods
    init(rowContent: PokedexListView.Content) {
        self.rowContent = rowContent
    }
    
    // MARK: Methods
    func showPokemon() {
        Task {
            do {
                let pokemon = try await API.shared.getPokemonInformation(id: rowContent.key)
                currentSheetDestination = .pokemonView(
                    nameInformation: rowContent.value,
                    pokemon: pokemon
                )
            } catch {}
        }
    }
}
