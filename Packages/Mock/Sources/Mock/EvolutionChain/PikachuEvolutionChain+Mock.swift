//
//  PikachuEvolutionChain+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Pikachu Evolution Chain Mockup
public let pikachuEvolutionChain = EvolutionChain(
    id: 10,
    chain: EvolutionChainLink(
        details: nil,
        evolvingTo: [
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .levelUp(.minHappiness(220))
                ),
                evolvingTo: [
                    EvolutionChainLink(
                        details: EvolutionDetails(
                            heldItem: nil,
                            timeOfDay: nil,
                            trigger: .item(83)
                        ),
                        evolvingTo: [],
                        speciesId: 26
                    )
                ],
                speciesId: 25
            )
        ],
        speciesId: 172
    )
)
