//
//  MapperBasePokemonInformationTests.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation
import Model
import XCTest
@testable import Mapper

// MARK: - Mapper Tests: All Base Information (Bellsprout tested)
final class MapperBasePokemonInformationTests: XCTestCase, MapperTest {
    // MARK: Constants
    private enum Constants {
        fileprivate static let id = 69
        fileprivate static let pokemonTypes = [PokemonType.grass, .poison]
        fileprivate static let weight = 40
        fileprivate static let height = 7
        fileprivate static let stats = [
            PokemonStat.hp: 50,
            .attack: 75,
            .defense: 35,
            .specialAttack: 70,
            .specialDefense: 30,
            .speed: 40
        ]
        fileprivate static let baseHappiness = 70
        fileprivate static let captureRate = 255
        fileprivate static let isBaby = false
        fileprivate static let isMythical = false
        fileprivate static let isLegendary = false
        fileprivate static let textEntry = "A carnivorous\nPOKéMON that traps\nand eats bugs.\u{0C}It uses its root\nfeet to soak up\nneeded moisture."
    }
    
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
        XCTAssertEqual(pokemon?.id.id, Constants.id)
    }
    
    func testPokemonTypes() {
        XCTAssertEqual(Set(pokemon?.types ?? []), Set(Constants.pokemonTypes))
    }
    
    func testPokemonWeight() {
        XCTAssertEqual(pokemon?.weight, Constants.weight)
    }
    
    func testPokemonHeight() {
        XCTAssertEqual(pokemon?.height, Constants.height)
    }
    
    func testPokemonStats() {
        XCTAssertEqual(pokemon?.stats ?? [:], Constants.stats)
    }
    
    func testPokemonBaseHappiness() {
        XCTAssertEqual(pokemon?.baseHappiness, Constants.baseHappiness)
    }
    
    func testPokemonCaptureRate() {
        XCTAssertEqual(pokemon?.captureRate, Constants.captureRate)
    }
    
    func testPokemonIsBaby() {
        XCTAssertEqual(pokemon?.isBaby, Constants.isBaby)
    }
    
    func testPokemonIsMythical() {
        XCTAssertEqual(pokemon?.isMythical, Constants.isMythical)
    }
    
    func testPokemonIsLegendary() {
        XCTAssertEqual(pokemon?.isLegendary, Constants.isLegendary)
    }
    
    func testPokemonTextEntry() {
        XCTAssertEqual(pokemon?.textEntries[1]?[.english], Constants.textEntry)
    }
}
