//
//  GastlyEvolutionChain+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Gastly Evolution Chain Mockup
public let gastlyEvolutionChain = EvolutionChain(
    id: 40,
    chain: EvolutionChainLink(
        details: nil,
        evolvingTo: [
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .levelUp(.minLevel(25))
                ),
                evolvingTo: [
                    EvolutionChainLink(
                        details: EvolutionDetails(
                            heldItem: nil,
                            timeOfDay: nil,
                            trigger: .trade
                        ),
                        evolvingTo: [],
                        speciesId: 94
                    )
                ],
                speciesId: 93
            )
        ],
        speciesId: 92
    )
)
