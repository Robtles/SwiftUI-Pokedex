//
//  MapperEvolvingBellsproutFamilyTests.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation
import Model
import XCTest
@testable import Mapper

// MARK: - Mapper Tests: Bellsprout Evolutions
final class MapperEvolvingBellsproutFamilyTests: XCTestCase, MapperTest {
    // MARK: Constants
    private enum Constants {
        fileprivate static let firstEvolutionChainPokemonId = 69
        fileprivate static let firstEvolutionTrigger = EvolutionTrigger.levelUp(.minLevel(21))
        fileprivate static let secondEvolutionChainPokemonId = 70
        fileprivate static let secondEvolutionTrigger = EvolutionTrigger.item(85)
        fileprivate static let thirdEvolutionChainPokemonId = 71
    }
    
    let pokemonFamilyTest = PokemonFamily.bellsprout
    
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
            Constants.firstEvolutionChainPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.details?.trigger,
            Constants.firstEvolutionTrigger
        )
    }
    
    func testPokemonEvolvingWithItemSecondEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.species.id,
            Constants.secondEvolutionChainPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.details?.trigger,
            Constants.secondEvolutionTrigger
        )
    }
    
    func testPokemonEvolvingWithItemThirdEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.species.id,
            Constants.thirdEvolutionChainPokemonId
        )
    }
    
    func testPokemonEvolvingWithItemOnlyThreeEvolutions() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertNil(
            evolutionChain.chain.evolvingTo.first?.evolvingTo.first?.evolvingTo.first
        )
    }
}
