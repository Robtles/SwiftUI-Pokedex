//
//  NincadaEvolutionChain+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Nincada Evolution Chain Mockup
public let nincadaEvolutionChain = EvolutionChain(
    id: 40,
    chain: EvolutionChainLink(
        details: nil,
        evolvingTo: [
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .levelUp(.minLevel(20))
                ),
                evolvingTo: [],
                speciesId: 291
            ),
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .shed
                ),
                evolvingTo: [],
                speciesId: 292
            )
        ],
        speciesId: 290
    )
)
