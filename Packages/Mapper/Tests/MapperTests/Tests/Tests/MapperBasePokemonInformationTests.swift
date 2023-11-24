//
//  MapperBasePokemonInformationTests.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation
import Mock
import Model
import XCTest
@testable import Mapper

// MARK: - Mapper Tests: All Base Information (Bellsprout tested)
final class MapperBasePokemonInformationTests: XCTestCase, MapperTest {
    // MARK: Constants
    let pokemonFamilyTest = PokemonFamily.bellsprout
    
    // MARK: Properties
    var pokemon: Pokemon?

    // MARK: Test Methods
    override func setUp() async throws {
        try await super.setUp()
        pokemon = try loadPokemon()
    }
    
    func testPokemon() {
        XCTAssertNotNil(pokemon, "Pokemon #\(pokemonFamilyTest.pokemonId) was not correctly loaded")
    }
    
    func testPokemonId() {
        XCTAssertEqual(pokemon?.id.id, bellsproutPokemon.id.id)
    }
    
    func testPokemonTypes() {
        XCTAssertEqual(Set(pokemon?.types ?? []), Set(bellsproutPokemon.types))
    }
    
    func testPokemonWeight() {
        XCTAssertEqual(pokemon?.weight, bellsproutPokemon.weight)
    }
    
    func testPokemonHeight() {
        XCTAssertEqual(pokemon?.height, bellsproutPokemon.height)
    }
    
    func testPokemonStats() {
        XCTAssertEqual(pokemon?.stats ?? [:], bellsproutPokemon.stats)
    }
    
    func testPokemonBaseHappiness() {
        XCTAssertEqual(pokemon?.baseHappiness, bellsproutPokemon.baseHappiness)
    }
    
    func testPokemonCaptureRate() {
        XCTAssertEqual(pokemon?.captureRate, bellsproutPokemon.captureRate)
    }
    
    func testPokemonIsBaby() {
        XCTAssertEqual(pokemon?.isBaby, bellsproutPokemon.isBaby)
    }
    
    func testPokemonIsMythical() {
        XCTAssertEqual(pokemon?.isMythical, bellsproutPokemon.isMythical)
    }
    
    func testPokemonIsLegendary() {
        XCTAssertEqual(pokemon?.isLegendary, bellsproutPokemon.isLegendary)
    }
    
    func testPokemonTextEntry() {
        XCTAssertEqual(
            pokemon?.textEntries[Version.red]?[.english], 
            bellsproutPokemon.textEntries[Version.red]?[.english]
        )
        XCTAssertEqual(
            pokemon?.textEntries[Version.yellow]?[.english],
            bellsproutPokemon.textEntries[Version.yellow]?[.english]
        )
    }
}
