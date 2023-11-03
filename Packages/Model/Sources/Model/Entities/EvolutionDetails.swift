//
//  EvolutionDetails.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Evolution Details
/// Details about an evolution
public struct EvolutionDetails {
    // MARK: Properties
    /// The id of the item that the Pokémon needs to hold for this evolution to happen - nil if none needed
    public let heldItem: ID<IdentifiableType.Item>?
    /// The id of the item required for this evolution to happen - nil if none needed
    public let item: ID<IdentifiableType.Item>?
    /// Set if this evolution can only happen at a specific time of day
    public let timeOfDay: TimeOfDay?
    /// The evolution trigger
    public let trigger: EvolutionTrigger
    
    // MARK: Init Methods
    public init(
        heldItem: ID<IdentifiableType.Item>?, 
        item: ID<IdentifiableType.Item>?,
        timeOfDay: TimeOfDay?,
        trigger: EvolutionTrigger
    ) {
        self.heldItem = heldItem
        self.item = item
        self.timeOfDay = timeOfDay
        self.trigger = trigger
    }
}
