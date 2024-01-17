//
//  PersistenceContent.swift
//
//  Created by Rob on 16/01/2024.
//

import Model
import SwiftData

// MARK: - Persistence Content
@Model
public class PersistenceContent {
    // MARK: Properties
    public var pokemonNames: LocalizedIndexedContentDictionary = [:]
    public var pokemons: [Int: Pokemon] = [:]
    
    // MARK: Init Methods
    public init(pokemonNames: LocalizedIndexedContentDictionary) {
        self.pokemonNames = pokemonNames
        self.pokemons = [:]
    }
}
