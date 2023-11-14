//
//  PokemonTypeJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: Pokemon Type
struct PokemonTypeJSONEntity: Decodable {
    // MARK: Properties
    let slot: Int
    let type: NameURLJSONEntity
}
