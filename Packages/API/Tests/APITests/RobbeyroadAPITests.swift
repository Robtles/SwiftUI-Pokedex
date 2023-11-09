//
//  RobbeyroadAPITests.swift
//
//  Created by Rob on 06/11/2023.
//

import API
import Moya
import XCTest

final class RobbeyroadAPITests: CommonAPITests<RobbeyRoad> {
    // MARK: Test Reachable API Methods
    func testPokemonListReachable() async throws {
        let result = try await provider.testServerReachable(for: .pokemons)
        XCTAssert(result, "HTTP request failed")
    }
    
    // MARK: Test Data Fetch Methods
    func testFetchDataFromRobbeyRoadAPI() async throws {
        let result = try await provider.getData(for: .pokemons)
        XCTAssertNoThrow(try JSONSerialization.jsonObject(with: result), "Result data is not a valid JSON")
    }
}
