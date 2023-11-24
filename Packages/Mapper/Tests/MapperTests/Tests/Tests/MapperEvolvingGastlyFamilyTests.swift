//
//  MapperEvolvingGastlyFamilyTests.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation
import Mock
import Model
import XCTest
@testable import Mapper

// MARK: - Mapper Tests: Gastly Evolutions
final class MapperEvolvingGastlyFamilyTests: XCTestCase, MapperTest {
    // MARK: Constants
    let pokemonFamilyTest = PokemonFamily.gastly
    
    // MARK: Properties
    var pokemon: Pokemon?
    
    // MARK: Test Methods
    override func setUp() async throws {
        try await super.setUp()
        pokemon = try loadPokemon()
    }
    
    func testPokemonEvolvingWithItemFirstEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.species.id,
            gastlyEvolutionChain.chain.species.id
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.details?.trigger,
            gastlyEvolutionChain.chain.evolvingTo.first?.details?.trigger
        )
    }
    
    func testPokemonEvolvingWithItemSecondEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.species.id,
            gastlyEvolutionChain.chain.evolvingTo.first?.species.id
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.details?.trigger,
            gastlyEvolutionChain.chain.evolvingTo.first?.evolvingTo.first?.details?.trigger
        )
    }
    
    func testPokemonEvolvingWithItemThirdEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.species.id,
            gastlyEvolutionChain.chain.evolvingTo.first?.evolvingTo.first?.species.id
        )
    }
    
    func testPokemonEvolvingWithItemOnlyThreeEvolutions() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertNil(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.evolvingTo.first
        )
    }
}
