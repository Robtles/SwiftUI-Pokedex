//
//  BellsproutPokemon+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Bellsprout Pokemon Mockup
fileprivate let redBlueEeveeEnglishTextEntry = "A carnivorous\nPOKéMON that traps\nand eats bugs.\u{0C}It uses its root\nfeet to soak up\nneeded moisture."
fileprivate let yellowEeveeEnglishTextEntry = "Prefers hot and\nhumid places.\nIt ensnares tiny\u{0C}insects with its\nvines and devours\nthem."

public let eeveePokemon = Pokemon(
    id: 133,
    types: [.normal],
    weight: 65,
    height: 3,
    stats: [
        .hp: 55,
        .attack: 55,
        .defense: 50,
        .specialAttack: 45,
        .specialDefense: 65,
        .speed: 55
    ],
    baseHappiness: 50,
    captureRate: 45,
    evolutionChain: eeveeEvolutionChain,
    textEntries: [
        Version.red: [
            .english: redBlueEeveeEnglishTextEntry
        ],
        Version.blue: [
            .english: redBlueEeveeEnglishTextEntry
        ],
        Version.yellow: [
            .english: yellowEeveeEnglishTextEntry
        ]
    ],
    isBaby: false,
    isLegendary: false,
    isMythical: false
)!
