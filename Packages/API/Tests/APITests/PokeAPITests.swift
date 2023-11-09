//
//  PokeAPITests.swift
//
//  Created by Rob on 07/11/2023.
//

import API
import Moya
import XCTest

final class PokeAPITests: CommonAPITests<PokeAPI> {
    // MARK: Test Reachable API Methods
    func testPokemonAPIReachable() async throws {
        let result = try await provider.testServerReachable(for: .pokemon(1))
        XCTAssert(result, "HTTP request failed")
    }
    
    func testPokemonSpeciesAPIReachable() async throws {
        let result = try await provider.testServerReachable(for: .pokemonSpecies(1))
        XCTAssert(result, "HTTP request failed")
    }
    
    // MARK: Test Data Fetch Methods
    func testFetchDataFromPokemonAPI() async throws {
        let result = try await provider.getData(for: .pokemon(1))
        XCTAssertNoThrow(try JSONSerialization.jsonObject(with: result), "Result data is not a valid JSON")
    }
    
    func testFetchDataFromPokemonSpeciesAPI() async throws {
        let result = try await provider.getData(for: .pokemonSpecies(1))
        XCTAssertNoThrow(try JSONSerialization.jsonObject(with: result), "Result data is not a valid JSON")
    }
}
