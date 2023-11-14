//
//  PokemonSpeciesJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: Pokemon Species
struct PokemonSpeciesJSONEntity: Decodable {
    // MARK: Properties
    let baseHappiness: Int
    let captureRate: Int
    let evolutionChain: URLJSONEntity
    let flavorTextEntries: [FlavorTextJSONEntity]
    let isBaby: Bool
    let isLegendary: Bool
    let isMythical: Bool
}
