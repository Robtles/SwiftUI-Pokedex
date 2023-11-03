//
//  PokemonStat.swift
//
//  Created by Rob on 29/10/2023.
//

import Foundation

// MARK: - Pokemon Stat
/// Enumerates the existing Pokémon stats
public enum PokemonStat: String, CaseIterable {
    // MARK: Cases
    /// The attack stat
    case attack = "attack"
    /// The defense stat
    case defense = "defense"
    /// The special attack stat
    case specialAttack = "special-attack"
    /// The special defense stat
    case specialDefense = "special-defense"
    /// The speed stat
    case speed = "speed"
    /// The HP stat
    case hp = "hp"
}
