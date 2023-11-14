//
//  PokemonStatJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: Pokemon Stat
struct PokemonStatJSONEntity: Decodable {
    // MARK: Properties
    let baseStat: Int
    let stat: NameURLJSONEntity
}
