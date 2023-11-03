//
//  EvolutionChainLink.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Evolution Chain Link
/// A Pokémon evolution chain link
public struct EvolutionChainLink {
    // MARK: Properties
    /// The details for this evolution chain
    public let details: EvolutionDetails
    /// The possible recursive evolutions for this chain
    public let evolvingTo: [EvolutionChainLink]
    /// The evolving Pokémon species
    public let id: ID<IdentifiableType.Pokemon>
    
    // MARK: Init Methods
    /// Initializes a Pokémon evolution chain link, keeping only the Pokémon valid identifiers
    public init(
        details: EvolutionDetails, 
        evolvingTo: [EvolutionChainLink],
        id: ID<IdentifiableType.Pokemon>
    ) {
        self.details = details
        self.evolvingTo = evolvingTo.filter { Pokemon.includes($0.id) }
        self.id = id
    }
}
