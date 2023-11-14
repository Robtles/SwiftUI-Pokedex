//
//  PokeApiProviderTests.swift
//
//  Created by Rob on 07/11/2023.
//

import Moya
import Provider
import XCTest

// MARK: - PokeAPI Provider
final class PokeApiProviderTests: CommonProviderTests<PokeApi> {
    // MARK: Test Methods
    func testEvolutionChainReachable() async throws {
        let result = try await provider.testServerReachable(for: .evolutionChain(1))
        XCTAssert(result, "HTTP request failed")
    }
    
    func testPokemonReachable() async throws {
        let result = try await provider.testServerReachable(for: .pokemon(1))
        XCTAssert(result, "HTTP request failed")
    }
    
    func testPokemonSpeciesReachable() async throws {
        let result = try await provider.testServerReachable(for: .pokemonSpecies(1))
        XCTAssert(result, "HTTP request failed")
    }
    
    func testEvolutionChainFetchData() async throws {
        let result = try await provider.getData(for: .evolutionChain(1))
        XCTAssertNoThrow(try JSONSerialization.jsonObject(with: result), "Result data is not a valid JSON")
    }
    
    func testPokemonFetchData() async throws {
        let result = try await provider.getData(for: .pokemon(1))
        XCTAssertNoThrow(try JSONSerialization.jsonObject(with: result), "Result data is not a valid JSON")
    }
    
    func testPokemonSpeciesFetchData() async throws {
        let result = try await provider.getData(for: .pokemonSpecies(1))
        XCTAssertNoThrow(try JSONSerialization.jsonObject(with: result), "Result data is not a valid JSON")
    }
}
