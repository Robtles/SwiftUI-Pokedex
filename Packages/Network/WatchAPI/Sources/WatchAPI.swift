//
//  WatchAPI.swift
//
//  Created by Rob on 03/01/2024.
//

import API
import Foundation
import Mapper
import Model

/// The API specifically made for watchOS
public struct WatchAPI {
    // MARK: Singleton
    /// The shared API singleton
    public static let shared = WatchAPI()
    
    // MARK: Init Methods
    private init() {}
    
    // MARK: Data Fetching
    /// Gets all the Pokemons with their localizations
    /// - Returns: A dictionary with the Pokémon ids as keys, and their localized names as values
    public func getAllPokemons() async throws -> LocalizedIndexedContentDictionary {
        let pokemonsFileName = "pokemons"
        guard let path = Bundle.module.path(
            forResource: pokemonsFileName,
            ofType: "json"
        ) else {
            throw WatchError.jsonNotFound(pokemonsFileName)
        }
        return try Mapper.shared.mapToPokemonList(
            try Data(
                contentsOf: URL(filePath: path)
            )
        )
    }
    
    /// Gets information about a specific Pokémon
    /// - Parameter id: The national Pokédex id of the Pokémon for which to fetch information
    /// - Returns: The Pokémon with all the required data
    public func getPokemonInformation(id: Int) async throws -> Pokemon {
        return try await API.shared.getPokemonInformation(id: id)
    }
    
    public func getAllVersions() async throws -> [Version] {
        return try await API.shared.getAllVersions()
    }
}
