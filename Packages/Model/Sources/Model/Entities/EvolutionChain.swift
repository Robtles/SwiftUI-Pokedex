//
//  EvolutionChain.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Evolution Chain
/// A Pokémon evolution chain
public struct EvolutionChain {
    // MARK: Properties
    /// The evolution chain unique id
    public let id: ID<IdentifiableType.EvolutionChain>
    /// The base chain link for this whole chain - recursively contains the evolving Pokémons
    public let chain: EvolutionChainLink
    
    // MARK: Init Methods
    public init(
        id: ID<IdentifiableType.EvolutionChain>, 
        chain: EvolutionChainLink
    ) {
        self.id = id
        self.chain = chain
    }
}
