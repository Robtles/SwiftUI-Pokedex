//
//  PokedexListRowViewModel.swift
//  SwiftUI-Pokedex-Watch-MVVM
//
//  Created by Rob on 05/01/2024.
//

import API
import Model
import Persistence
import SwiftData
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
    private func get(
        pokemonWithId id: Int,
        content: [PersistenceContent],
        from modelContext: ModelContext
    ) async throws -> Pokemon {
        if let pokemon = content.first?.pokemons[id] {
            return pokemon
        } else {
            let pokemon = try await API.shared.getPokemonInformation(id: id)
            if let content = content.first {
                content.pokemons[pokemon.id.id] = pokemon
                modelContext.insert(content)
            }
            return pokemon
        }
    }
    
    func showPokemon(
        content: [PersistenceContent],
        from modelContext: ModelContext
    ) {
        Task {
            do {
                let pokemon = try await get(pokemonWithId: rowContent.key, content: content, from: modelContext)
                currentSheetDestination = .pokemonView(
                    nameInformation: rowContent.value,
                    pokemon: pokemon
                )
            } catch {}
        }
    }
}

extension ModelContext: @unchecked Sendable {}
