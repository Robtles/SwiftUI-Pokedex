//
//  CoreMapper.swift
//
//  Created by Rob on 11/11/2023.
//

import Foundation
import Model

public struct Mapper {
    // MARK: Properties
    private(set) lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    // MARK: Singleton
    /// The shared Mapper singleton
    public static var shared = Mapper()
    
    // MARK: Init Methods
    private init() {}
    
    // MARK: Exposed Map Methods
    /// Decodes some Data into a localized list of Pokémon
    /// - Parameter data: The data which should be a valid JSON
    /// - Returns: The Pokémon list content, a dictionary keyed by Pokémon ids and with their localized names as values
    public func mapToPokemonList(
        _ data: Data
    ) throws -> [Int: LocalizedContentDictionary] {
        return try Mapper.shared.decoder.decode([Int: LocalizedContentDictionary].self, from: data)
    }
    
    public func mapToPokemon(
        id: ID<IdentifiableType.Pokemon>,
        pokemonData: Data,
        pokemonSpeciesData: Data,
        evolutionChainData: Data
    ) throws -> Pokemon {
        let pokemonRepresentation = try Mapper.shared.decoder.decode(PokemonJSONEntity.self, from: pokemonData)
        let pokemonSpeciesRepresentation = try Mapper.shared.decoder.decode(PokemonSpeciesJSONEntity.self, from: pokemonSpeciesData)
        let evolutionChainRepresentation = try Mapper.shared.decoder.decode(PokemonEvolutionChainJSONEntity.self, from: evolutionChainData)
        let evolutionChain = try EvolutionChainMapper.getEvolutionChain(
            from: evolutionChainRepresentation
        )
        guard let pokemon = Pokemon(
            id: id,
            types: PokemonMapper.getTypes(from: pokemonRepresentation),
            weight: pokemonRepresentation.weight,
            height: pokemonRepresentation.height,
            stats: PokemonMapper.getStats(from: pokemonRepresentation),
            baseHappiness: pokemonSpeciesRepresentation.baseHappiness,
            captureRate: pokemonSpeciesRepresentation.captureRate,
            evolutionChain: evolutionChain,
            textEntries: PokemonSpeciesMapper.getTextEntries(from: pokemonSpeciesRepresentation.flavorTextEntries),
            isBaby: pokemonSpeciesRepresentation.isBaby,
            isLegendary: pokemonSpeciesRepresentation.isLegendary,
            isMythical: pokemonSpeciesRepresentation.isMythical
        ) else {
            throw MapperError.pokemonInitializationFailed
        }
        return pokemon
    }
    
    public func mapToVersion(
        id: Int,
        with versionData: Data
    ) throws -> Version {
        let versionRepresentation = try Mapper.shared.decoder.decode(VersionJSONEntity.self, from: versionData)
        return Version(
            id: ID<IdentifiableType.Version>(id),
            names: versionRepresentation.names.reduce(into: [:]) {
                if let language = Language(rawValue: $1.language.name) {
                    $0[language] = $1.name
                }
            }
        )
    }
        
    public func mapEvolutionChainId(
        from pokemonSpeciesData: Data,
        forPokemonId pokemonId: Int
    ) throws -> Int {
        let pokemonSpecies = try Mapper.shared.decoder.decode(PokemonSpeciesJSONEntity.self, from: pokemonSpeciesData)
        guard let evolutionChainId = pokemonSpecies.evolutionChain.id else {
            throw MapperError.idNotFound("No ID was found for Pokemon #\(pokemonId)")
        }
        return evolutionChainId
    }        
}
