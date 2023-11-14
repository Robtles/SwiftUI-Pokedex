//
//  PokemonEvolutionDetailJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: Pokemon Evolution Detail
struct PokemonEvolutionDetailJSONEntity: Decodable {
    // MARK: Properties
    let heldItem: NameURLJSONEntity?
    let item: NameURLJSONEntity?
    let minAffection: Int?
    let minBeauty: Int?
    let minHappiness: Int?
    let minLevel: Int?
    let timeOfDay: String
    let trigger: NameURLJSONEntity
}
