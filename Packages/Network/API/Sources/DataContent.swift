//
//  DataContent.swift
//
//  Created by Rob on 03/01/2024.
//

import Model

// MARK: Data Content
/// Represents the data expected to get from the base API call
public struct DataContent {
    // MARK: Properties
    public let pokemons: LocalizedIndexedContentDictionary
    public let versions: [Version]
    
    // MARK: Init Methods
    public init(
        pokemons: LocalizedIndexedContentDictionary, 
        versions: [Version]
    ) {
        self.pokemons = pokemons
        self.versions = versions
    }
}
