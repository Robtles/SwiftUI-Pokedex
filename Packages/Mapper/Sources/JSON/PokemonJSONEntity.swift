//
//  PokemonJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: Pokemon
struct PokemonJSONEntity: Decodable {
    // MARK: Properties
    let height: Int
    let stats: [PokemonStatJSONEntity]
    let types: [PokemonTypeJSONEntity]
    let weight: Int
}
