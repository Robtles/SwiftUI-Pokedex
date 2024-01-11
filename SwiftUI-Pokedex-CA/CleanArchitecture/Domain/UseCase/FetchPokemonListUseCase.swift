//
//  FetchContentUseCase.swift
//  SwiftUI-Pokedex-CA
//
//  Created by Rob on 11/01/2024.
//

import API
import Foundation

// MARK: Fetch Pokémon List Use Case
protocol FetchPokemonListUseCase {
    func fetchPokemonList() async throws -> DataContent
}
