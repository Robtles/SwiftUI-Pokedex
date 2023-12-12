//
//  API.swift
//
//  Created by Rob on 11/11/2023.
//

import Foundation
import Mapper
import Model
import Moya
import Provider

// MARK: - API
/// API gives access to the necessary methods to fetch data
public struct API {
    // MARK: Internal Properties
    /// The PokeAPI provider
    private let pokeAPIProvider = MoyaProvider<PokeApi>()
    /// The RobbeyRoad provider
    private let robbeyroadProvider = MoyaProvider<RobbeyRoad>()
    
    // MARK: Singleton
    /// The shared API singleton
    public static let shared = API()
    
    // MARK: Init Methods
    private init() {}
    
    // MARK: Data Fetching
    /// Gets all the items with their localizations
    /// - Returns: A dictionary with the items ids as keys, and their localized names as values
    public func getAllItems() async throws -> LocalizedIndexedContentDictionary {
        return try Mapper.shared.mapToItemList(
            try await robbeyroadProvider.getData(for: .items)
        )
    }
    
    /// Gets all the Pokemons with their localizations
    /// - Returns: A dictionary with the Pokémon ids as keys, and their localized names as values
    public func getAllPokemons() async throws -> LocalizedIndexedContentDictionary {
        return try Mapper.shared.mapToPokemonList(
            try await robbeyroadProvider.getData(for: .pokemons)
        )
    }
    
    /// Gets information about a specific Pokémon
    /// - Parameter id: The national Pokédex id of the Pokémon for which to fetch information
    /// - Returns: The Pokémon with all the required data
    public func getPokemonInformation(id: Int) async throws -> Pokemon {
        async let pokemonData = try pokeAPIProvider.getData(for: .pokemon(id))
        async let pokemonSpeciesData = try pokeAPIProvider.getData(for: .pokemonSpecies(id))
        let evolutionChainId = try await Mapper.shared.mapEvolutionChainId(
            from: pokemonSpeciesData,
            forPokemonId: id
        )
        async let evolutionChainData = try pokeAPIProvider.getData(for: .evolutionChain(evolutionChainId))
        return try await Mapper.shared.mapToPokemon(
            id: ID<IdentifiableType.Pokemon>(id),
            pokemonData: pokemonData,
            pokemonSpeciesData: pokemonSpeciesData,
            evolutionChainData: evolutionChainData
        )
    }
    
    public func getAllVersions() async throws -> [Version] {
        var result: [Version] = []
        await withTaskGroup(of: Optional<Version>.self) { taskGroup in
            Version.Constants.validVersions.forEach { id in
                taskGroup.addTask {
                    return try? Mapper.shared.mapToVersion(
                        id: id,
                        with: try await pokeAPIProvider.getData(for: .version(id))
                    )
                }
            }
            for await version in taskGroup.compactMap({ $0 }) {
                result.append(version)
            }
        }
        return result
    }
}
