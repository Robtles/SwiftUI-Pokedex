//
//  PokemonEvolutionChainLinkJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: Pokemon Evolution Chain Link
struct PokemonEvolutionChainLinkJSONEntity: Decodable {
    // MARK: Properties
    let evolutionDetails: [PokemonEvolutionDetailJSONEntity]
    let evolvesTo: [PokemonEvolutionChainLinkJSONEntity]
    let isBaby: Bool
    let species: NameURLJSONEntity
}
