//
//  MapperEvolvingNincadaFamilyTests.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation
import Model
import XCTest
@testable import Mapper

final class MapperEvolvingNincadaFamilyTests: XCTestCase, MapperTest {
    // MARK: Constants
    private enum Constants {
        fileprivate static let initialPokemonId = 290
        fileprivate static let ninjaskPokemonId = 291
        fileprivate static let shedinjaPokemonId = 292
        fileprivate static let evolutionCount = 2
        fileprivate static let ninjaskEvolutionTrigger = EvolutionTrigger.levelUp(.minLevel(20))
        fileprivate static let shedinjaEvolutionTrigger = EvolutionTrigger.shed
    }
    
    let pokemonFamilyTest = PokemonFamily.nincada
    
    // MARK: Properties
    var pokemon: Pokemon?
    
    // MARK: Test Methods
    override func setUp() async throws {
        try await super.setUp()
        pokemon = try loadPokemon()
    }
    
    func testInitialPokemonEvolving() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.species.id,
            Constants.initialPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.count,
            Constants.evolutionCount
        )
    }
    
    func testPokemonFirstEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.species.id,
            Constants.ninjaskPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.details?.trigger,
            Constants.ninjaskEvolutionTrigger
        )
    }
    
    func testPokemonSecondEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.last?.species.id,
            Constants.shedinjaPokemonId
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.last?.details?.trigger,
            Constants.shedinjaEvolutionTrigger
        )
    }
}
