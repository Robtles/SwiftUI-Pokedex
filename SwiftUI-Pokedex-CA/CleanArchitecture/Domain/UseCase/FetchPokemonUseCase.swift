//
//  FetchPokemonUseCase.swift
//  SwiftUI-Pokedex-CA
//
//  Created by Rob on 11/01/2024.
//

import Foundation
import Model

// MARK: Fetch Pokémon Use Case
protocol FetchPokemonUseCase {
    func fetchPokemon(id: Int) async throws -> Pokemon
}
