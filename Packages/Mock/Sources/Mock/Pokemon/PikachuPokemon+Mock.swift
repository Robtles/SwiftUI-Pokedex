//
//  PikachuPokemon+Mock.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

// MARK: - Pikachu Pokemon Mockup
fileprivate let redBluePikachuEnglishTextEntry = "When several of\nthese POKéMON\ngather, their\u{0C}electricity could\nbuild and cause\nlightning storms."
fileprivate let yellowPikachuEnglishTextEntry = "It keeps its tail\nraised to monitor\nits surroundings.\u{0C}If you yank its\ntail, it will try\nto bite you."

public let pikachuPokemon = Pokemon(
    id: 25,
    types: [.electric],
    weight: 60,
    height: 4,
    stats: [
        .hp: 35,
        .attack: 55,
        .defense: 40,
        .specialAttack: 50,
        .specialDefense: 50,
        .speed: 90
    ],
    baseHappiness: 50,
    captureRate: 190,
    evolutionChain: pikachuEvolutionChain,
    textEntries: [
        Version.red: [
            .english: redBluePikachuEnglishTextEntry
        ],
        Version.blue: [
            .english: redBluePikachuEnglishTextEntry
        ],
        Version.yellow: [
            .english: yellowPikachuEnglishTextEntry
        ]
    ],
    isBaby: false,
    isLegendary: false,
    isMythical: false
)!
