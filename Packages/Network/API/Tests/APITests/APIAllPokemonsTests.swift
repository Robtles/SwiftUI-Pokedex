//
//  APIAllPokemonsTests.swift
//
//  Created by Rob on 14/11/2023.
//

import Foundation
import Model
import XCTest
@testable import API

// MARK: - API Tests: All Pokemons
final class APIAllPokemonsTests: XCTestCase {
    // MARK: Constants
    private enum Constants {
        fileprivate static let pokemonName = "Bulbizarre"
    }
    
    // MARK: Properties
    private var allPokemons: [Int: LocalizedContentDictionary]?
    
    // MARK: Test Methods
    override func setUp() async throws {
        try await super.setUp()
        allPokemons = try await API.shared.getAllPokemons()
    }
    
    func testLoadedAllPokemons() {
        XCTAssertNotNil(allPokemons)
        let allPokemons = allPokemons!
        XCTAssertEqual(allPokemons.count, Pokemon.Constants.maximumId)
        XCTAssertEqual(allPokemons[1]?[.french], Constants.pokemonName)
    }
}
