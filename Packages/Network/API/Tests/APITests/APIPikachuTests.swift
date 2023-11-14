//
//  APIPikachuTests.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation
import Model
import XCTest
@testable import API

// MARK: - API Tests: Pikachu
final class APIPikachuTests: XCTestCase {
    // MARK: Properties
    private var pokemon: Pokemon?
    
    // MARK: Test Methods
    override func setUp() async throws {
        try await super.setUp()
        pokemon = try await API.shared.getPokemonInformation(id: 25)
    }
    
    func testLoadedPokemon() {
        XCTAssertNotNil(pokemon)
        let pokemon = pokemon!
        XCTAssertEqual(pokemon.id, 25)
        XCTAssertEqual(Set(pokemon.types), Set([.electric]))
    }
}
