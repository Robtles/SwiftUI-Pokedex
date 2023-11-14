//
//  PokemonEvolutionChainJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: Pokemon Evolution Chain
struct PokemonEvolutionChainJSONEntity: Decodable {
    // MARK: Properties
    let chain: PokemonEvolutionChainLinkJSONEntity
    let id: Int
}
