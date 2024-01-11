//
//  APIRepository.swift
//  SwiftUI-Pokedex-CA
//
//  Created by Rob on 11/01/2024.
//

import API
import Foundation
import Model
import WatchAPI

// MARK: - API Repository
/// The API repository, to fetch remote data
final public class APIRepository: Repository {
    // MARK: Properties
    private var mockProvider: WatchAPI = .shared
    private var provider: API = .shared
    
    // MARK: Singleton
    public static var shared = APIRepository()
    
    // MARK: Init Methods
    private init() {}
    
    // MARK: Repository Conformance
    func fetchPokemon(id: Int) async throws -> Pokemon {
        return try await provider.getPokemonInformation(id: id)
    }
    
    func fetchPokemonList() async throws -> DataContent {
        return try await withThrowingTaskGroup(of: DataContent.self) { _ in
            let pokemons = try await mockProvider.getAllPokemons()
            let versions = try await mockProvider.getAllVersions()
            return DataContent(
                pokemons: pokemons,
                versions: versions
            )
        }
    }
}
