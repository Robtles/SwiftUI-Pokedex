//
//  Names+Mock.swift
//
//  Created by Rob on 26/11/2023.
//

import Foundation
import Model

// MARK: - Pokemon Names Mockup
public let firstLocalizedPokemons: [Int: LocalizedContentDictionary] = [
    1: [.english: "Bulbasaur"],
    2: [.english: "Ivysaur"],
    3: [.english: "Venusaur"],
    4: [.english: "Charmander"],
    5: [.english: "Charmeleon"],
    6: [.english: "Charizard"],
    7: [.english: "Squirtle"],
    8: [.english: "Wartortle"],
    9: [.english: "Blastoise"],
    10: [.english: "Caterpie"],
    11: [.english: "Metapod"],
    12: [.english: "Butterfree"]
]

public let pikachuLocalizedNames: LocalizedContentDictionary = Language.allCases.reduce(into: [:], { $0[$1] = pikachuName })

// MARK: - Internal Pokemon Names Mockup
private let pikachuName = "Pikachu"
