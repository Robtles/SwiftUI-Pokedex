//
//  MapperEvolvingOnixFamilyTests.swift
//
//  Created by Rob on 14/11/2023.
//

import Foundation
import Model
import XCTest
@testable import Mapper

// MARK: - Mapper Tests: Onix Evolutions
final class MapperEvolvingOnixFamilyTests: XCTestCase, MapperTest {
    // MARK: Constants
    private enum Constants {
        fileprivate static let initialPokemonId = 95
        fileprivate static let evolvedPokemonId = 208
        fileprivate static let evolutionTrigger = EvolutionTrigger.trade
        fileprivate static let evolutionHeldItemId = 210
    }
    
    let pokemonFamilyTest = PokemonFamily.onix
    
    // MARK: Properties
    var pokemon: Pokemon?
    
    // MARK: Test Methods
    override func setUp() async throws {
        try await super.setUp()
        pokemon = try loadPokemon()
    }
    
    func testEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.species.id,
            Constants.initialPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.species.id,
            Constants.evolvedPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.details?.heldItem?.id,
            Constants.evolutionHeldItemId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.details?.trigger,
            Constants.evolutionTrigger
        )
    }
}
