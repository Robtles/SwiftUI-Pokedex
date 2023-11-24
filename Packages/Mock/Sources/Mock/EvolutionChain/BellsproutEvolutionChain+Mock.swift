//
//  BellsproutEvolutionChain+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Bellsprout Evolution Chain Mockup
public let bellsproutEvolutionChain = EvolutionChain(
    id: 29,
    chain: EvolutionChainLink(
        details: nil,
        evolvingTo: [
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .levelUp(.minLevel(21))
                ),
                evolvingTo: [
                    EvolutionChainLink(
                        details: EvolutionDetails(
                            heldItem: nil,
                            timeOfDay: nil,
                            trigger: .item(85)
                        ),
                        evolvingTo: [],
                        speciesId: 71
                    )
                ],
                speciesId: 70
            )
        ],
        speciesId: 69
    )
)
