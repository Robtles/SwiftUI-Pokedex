//
//  GastlyEvolutionChain+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Eevee Evolution Chain Mockup
public let eeveeEvolutionChain = EvolutionChain(
    id: 67,
    chain: EvolutionChainLink(
        details: nil,
        evolvingTo: [
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .item(84)
                ),
                evolvingTo: [],
                speciesId: 134
            ),
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .item(83)
                ),
                evolvingTo: [],
                speciesId: 135
            ),
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .item(82)
                ),
                evolvingTo: [],
                speciesId: 136
            ),
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: .day,
                    trigger: .levelUp(.minHappiness(160))
                ),
                evolvingTo: [],
                speciesId: 196
            ),
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: .night,
                    trigger: .levelUp(.minHappiness(160))
                ),
                evolvingTo: [],
                speciesId: 197
            ),
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .item(85)
                ),
                evolvingTo: [],
                speciesId: 470
            ),
            EvolutionChainLink(
                details: EvolutionDetails(
                    heldItem: nil,
                    timeOfDay: nil,
                    trigger: .item(885)
                ),
                evolvingTo: [],
                speciesId: 471
            )
        ],
        speciesId: 133
    )
)
