//
//  NincadaEvolutionChain+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Onix Evolution Chain Mockup
public let onixEvolutionChain = EvolutionChain(
    id: 41,
    chain: EvolutionChainLink(
        details: nil,
        evolvingTo: [
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: 210,
                    timeOfDay: nil,
                    trigger: .trade
                ),
                evolvingTo: [],
                speciesId: 208
            )
        ],
        speciesId: 95
    )
)
