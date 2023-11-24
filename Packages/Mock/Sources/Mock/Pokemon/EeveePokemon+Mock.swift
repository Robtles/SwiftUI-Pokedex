//
//  BellsproutPokemon+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Bellsprout Pokemon Mockup
fileprivate let redBlueBellsproutEnglishTextEntry = "A carnivorous\nPOKéMON that traps\nand eats bugs.\u{0C}It uses its root\nfeet to soak up\nneeded moisture."
fileprivate let yellowBellsproutEnglishTextEntry = "Prefers hot and\nhumid places.\nIt ensnares tiny\u{0C}insects with its\nvines and devours\nthem."

public let bellsproutPokemon = Pokemon(
    id: 69,
    types: [.grass, .poison],
    weight: 40,
    height: 7,
    stats: [
        .hp: 50,
        .attack: 75,
        .defense: 35,
        .specialAttack: 70,
        .specialDefense: 30,
        .speed: 40
    ],
    baseHappiness: 70,
    captureRate: 255,
    evolutionChain: bellsproutEvolutionChain,
    textEntries: [
        Version.red: [
            .english: redBlueBellsproutEnglishTextEntry
        ],
        Version.blue: [
            .english: redBlueBellsproutEnglishTextEntry
        ],
        Version.yellow: [
            .english: yellowBellsproutEnglishTextEntry
        ]
    ],
    isBaby: false,
    isLegendary: false,
    isMythical: false
)!
