//
//  MapperEvolvingPikachuFamilyTests.swift
//
//  Created by Rob on 14/11/2023.
//

import Foundation
import Mock
import Model
import XCTest
@testable import Mapper

// MARK: - Mapper Tests: Pikachu Evolutions
final class MapperEvolvingPikachuFamilyTests: XCTestCase, MapperTest {
    // MARK: Constants
    let pokemonFamilyTest = PokemonFamily.pikachu
    
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
            pikachuEvolutionChain.chain.species.id
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.species.id,
            pikachuEvolutionChain.chain.evolvingTo.first?.species.id
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.details?.trigger,
            pikachuEvolutionChain.chain.evolvingTo.first?.details?.trigger
        )
    }
    
    func testPokemonEvolvingWithItemSecondEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.species.id,
            pikachuEvolutionChain.chain.evolvingTo.first?.evolvingTo.first?.species.id
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.details?.trigger,
            pikachuEvolutionChain.chain.evolvingTo.first?.evolvingTo.first?.details?.trigger
        )
    }
}
