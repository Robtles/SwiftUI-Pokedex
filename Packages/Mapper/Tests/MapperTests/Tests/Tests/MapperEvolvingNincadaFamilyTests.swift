//
//  MapperEvolvingNincadaFamilyTests.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation
import Mock
import Model
import XCTest
@testable import Mapper

final class MapperEvolvingNincadaFamilyTests: XCTestCase, MapperTest {
    // MARK: Constants
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
            nincadaEvolutionChain.chain.species.id
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.count,
            nincadaEvolutionChain.chain.evolvingTo.count
        )
    }
    
    func testPokemonFirstEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.species.id,
            nincadaEvolutionChain.chain.evolvingTo.first?.species.id
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.first?.details?.trigger,
            nincadaEvolutionChain.chain.evolvingTo.first?.details?.trigger
        )
    }
    
    func testPokemonSecondEvolution() {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.last?.species.id,
            nincadaEvolutionChain.chain.evolvingTo.last?.species.id
        )
        XCTAssertEqual(
            evolutionChain.chain.evolvingTo.last?.details?.trigger,
            nincadaEvolutionChain.chain.evolvingTo.last?.details?.trigger
        )
    }
}
