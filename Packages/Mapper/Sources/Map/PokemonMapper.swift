//
//  PokemonMapper.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation
import Model

struct PokemonMapper {
    // MARK: Internal Pokemon Mapping
    static func getTypes(
        from pokemonRepresentation: PokemonJSONEntity
    ) -> [PokemonType] {
        return pokemonRepresentation.types
            .sorted { $0.slot < $1.slot }
            .compactMap { PokemonType(rawValue: $0.type.name) }
    }
    
    static func getStats(
        from pokemonRepresentation: PokemonJSONEntity
    ) -> [PokemonStat: Int] {
        return pokemonRepresentation.stats.reduce(into: [:]) {
            if let stat = PokemonStat(rawValue: $1.stat.name) {
                $0[stat] = $1.baseStat
            }
        }
    }
}
