//
//  MapperTest.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation
@testable import Mapper
import Model
import XCTest

// MARK: - Pokemon Test File
fileprivate enum PokemonTestFile: String {
    // MARK: Cases
    case evolutionChain = "evolution-chain"
    case pokemon = "pokemon"
    case pokemonSpecies = "pokemon-species"
}

// MARK: - Mapper Test
protocol MapperTest: XCTestCase {
    // MARK: Properties
    var pokemon: Pokemon? { get }
    /// The Pokémon family which will be tested
    var pokemonFamilyTest: PokemonFamily { get }
    
    // MARK: Methods
    /// Loads a Pokémon from local JSON files
    func loadPokemon() throws -> Pokemon
}

extension MapperTest {
    /// An empty evolution chain that should not be used - otherwise it would throw an error
    var emptyEvolutionChain: EvolutionChain {
        return .init(
            id: 0,
            chain: EvolutionChainLink(
                details: nil,
                evolvingTo: [],
                speciesId: 0
            )
        )
    }
    
    func loadPokemon() throws -> Pokemon {
        let evolutionChainData = try getData(from: .evolutionChain)
        XCTAssertNoThrow(evolutionChainData)
        let pokemonData = try getData(from: .pokemon)
        XCTAssertNoThrow(pokemonData)
        let pokemonSpeciesData = try getData(from: .pokemonSpecies)
        XCTAssertNoThrow(pokemonSpeciesData)
        let pokemon = try Mapper.shared.mapToPokemon(
            id: ID<IdentifiableType.Pokemon>(pokemonFamilyTest.pokemonId),
            pokemonData: pokemonData,
            pokemonSpeciesData: pokemonSpeciesData,
            evolutionChainData: evolutionChainData
        )
        XCTAssertNoThrow(pokemon)
        return pokemon
    }
    
    // MARK: Internal Methods
    private func getData(
        from resourceTestFile: PokemonTestFile
    ) throws -> Data {
        let id = switch resourceTestFile {
        case .evolutionChain: pokemonFamilyTest.evolutionChainId
        case .pokemon, .pokemonSpecies: pokemonFamilyTest.pokemonId
        }
        return try getData(for: resourceTestFile.rawValue + "_\(id)")
    }
}

// MARK: - XCTestCase Extension
extension XCTestCase {
    func getData(
        for filename: String
    ) throws -> Data {
        guard let resourceURL = Bundle.module.url(
            forResource: filename,
            withExtension: "json"
        ) else {
            throw MapperTestError.urlNotFound(
                message: "Could not load " + filename + " JSON file"
            )
        }
        guard let data = try? Data(contentsOf: resourceURL) else {
            throw MapperTestError.dataFailed(
                message: "Could not extract data from " + filename + " JSON file"
            )
        }
        return data
    }
}
