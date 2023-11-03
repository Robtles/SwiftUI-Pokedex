//
//  EvolutionTrigger.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Evolution Trigger
/// The different possible ways for a Pokémon to evolve
public enum EvolutionTrigger {
    // MARK: Cases
    /// When being given a speific item
    case item(ID<IdentifiableType.Item>)
    /// When reaching a specific level
    case levelUp(EvolutionTriggerPokemonLevel)
    /// When a slot is available in the team and a Poké Ball is in the bag
    case shed
    /// When being traded
    case trade
}

// MARK: - Evolution Trigger by Pokemon Level
/// The possible ways for a Pokémon to evolve when reaching a specific level
public enum EvolutionTriggerPokemonLevel {
    // MARK: Cases
    /// When the Pokémon reaches a specific affection level
    case minAffection(Int)
    /// When the Pokémon reaches a specific beauty level
    case minBeauty(Int)
    /// When the Pokémon reaches a specific happiness level
    case minHappiness(Int)
    /// When the Pokémon reaches a specific level
    case minLevel(Int)
}
