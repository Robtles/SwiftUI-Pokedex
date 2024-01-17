//
//  Pokemon.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Pokemon
/// The representation of a Pokémon
public struct Pokemon: Codable {
    // MARK: Static & Constants
    /// The constants related to the Pokemon model
    public enum Constants {
        /// The minimum Pokemon id fetchable
        public static let minimumId = 1
        /// The maximum Pokemon id fetchable
        public static let maximumId = 493
    }
    
    /// Checks this Pokémon identifier is valid (between 1 and 493)
    public static func includes(_ id: ID<IdentifiableType.Pokemon>) -> Bool {
        return (Constants.minimumId...Constants.maximumId).contains(id.id)
    }
    
    // MARK: Properties
    /// The Pokémon identifier
    public let id: ID<IdentifiableType.Pokemon>
    /// The Pokémon types
    public let types: [PokemonType]
    /// The Pokémon weight, expressed in hectograms
    public let weight: Int
    /// The Pokémon height, expressed in decimeters
    public let height: Int
    /// The Pokémon base stats
    public let stats: [PokemonStat: Int]
    /// The base happiness of a Pokémon when caught, ranges from 0 to 255
    public let baseHappiness: Int
    /// The capture rate of a Pokémon, ranges from 0 to 255
    public let captureRate: Int
    /// The Pokémon evolution chain
    public let evolutionChain: EvolutionChain
    /// This Pokémon text entries, for each version and localized
    public let textEntries: LocalizedVersionedContentDictionary
    /// If it is a baby Pokémon
    public let isBaby: Bool
    /// If it is a legendary Pokémon
    public let isLegendary: Bool
    /// If it is a mythical Pokémon
    public let isMythical: Bool
    
    // MARK: Init Methods
    /// Initializes a Pokémon, preventing its id to exceed the limits (1 to 493)
    public init?(
        id: ID<IdentifiableType.Pokemon>,
        types: [PokemonType],
        weight: Int,
        height: Int,
        stats: [PokemonStat: Int],
        baseHappiness: Int,
        captureRate: Int,
        evolutionChain: EvolutionChain,
        textEntries: LocalizedVersionedContentDictionary,
        isBaby: Bool,
        isLegendary: Bool,
        isMythical: Bool
    ) {
        guard Pokemon.includes(id) else { return nil }
        self.id = id
        self.types = types
        self.weight = weight
        self.height = height
        self.stats = stats
        self.baseHappiness = baseHappiness
        self.captureRate = captureRate
        self.evolutionChain = evolutionChain
        self.textEntries = textEntries
        self.isBaby = isBaby
        self.isLegendary = isLegendary
        self.isMythical = isMythical
    }
}
