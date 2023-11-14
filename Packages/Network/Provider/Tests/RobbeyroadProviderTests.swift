//
//  RobbeyroadProviderTests.swift
//
//  Created by Rob on 06/11/2023.
//

import Moya
import Provider
import XCTest

// MARK: - RobbeyRoad Provider
final class RobbeyroadProviderTests: CommonProviderTests<RobbeyRoad> {
    // MARK: Test Methods
    func testPokemonListReachable() async throws {
        let result = try await provider.testServerReachable(for: .pokemons)
        XCTAssert(result, "HTTP request failed")
    }

    func testPokemonListFetchData() async throws {
        let result = try await provider.getData(for: .pokemons)
        XCTAssertNoThrow(try JSONSerialization.jsonObject(with: result), "Result data is not a valid JSON")
    }
}
