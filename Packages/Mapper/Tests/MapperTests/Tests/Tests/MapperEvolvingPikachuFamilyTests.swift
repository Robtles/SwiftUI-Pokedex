//
//  MapperEvolvingPikachuFamilyTests.swift
//
//  Created by Rob on 14/11/2023.
//

import Foundation
import Model
import XCTest
@testable import Mapper

// MARK: - Mapper Tests: Pikachu Evolutions
final class MapperEvolvingPikachuFamilyTests: XCTestCase, MapperTest {
    // MARK: Constants
    private enum Constants {
        fileprivate static let initialPokemonId = 172
        fileprivate static let secondPokemonId = 25
        fileprivate static let thirdPokemonId = 26
        fileprivate static let firstEvolutionTrigger = EvolutionTrigger.levelUp(.minHappiness(220))
        fileprivate static let secondEvolutionTrigger = EvolutionTrigger.item(83)
    }
    
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
            Constants.initialPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.species.id,
            Constants.secondPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.details?.trigger,
            Constants.firstEvolutionTrigger
        )
    }
    
    func testPokemonEvolvingWithItemSecondEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.species.id,
            Constants.thirdPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.details?.trigger,
            Constants.secondEvolutionTrigger
        )
    }
}
