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
final class MapperEvolvingEeveeFamilyTests: XCTestCase, MapperTest {
    // MARK: Constants
    private enum Constants {
        fileprivate static let vaporeonId = 134
        fileprivate static let jolteonId = 135
        fileprivate static let flareonId = 136
        fileprivate static let espeonId = 196
        fileprivate static let umbreonId = 197
        fileprivate static let leafeonId = 470
        fileprivate static let glaceonId = 471
    }
    
    let pokemonFamilyTest = PokemonFamily.eevee
    
    // MARK: Properties
    var pokemon: Pokemon?
    
    // MARK: Test Methods
    override func setUp() async throws {
        try await super.setUp()
        pokemon = try loadPokemon()
    }
    
    func testVaporeonEvolution() {
        _test(expectedEvolutionId: Constants.vaporeonId)
    }
        
    func testJolteonEvolution() {
        _test(expectedEvolutionId: Constants.jolteonId)
    }
    
    func testFlareonEvolution() {
        _test(expectedEvolutionId: Constants.flareonId)
    }
    
    func testEspeonEvolution() {
        _test(expectedEvolutionId: Constants.espeonId)
    }
    
    func testUmbreonEvolution() {
        _test(expectedEvolutionId: Constants.umbreonId)
    }
    
    func testLeafeonEvolution() {
        _test(expectedEvolutionId: Constants.leafeonId)
    }
    
    func testGlaceonEvolution() {
        _test(expectedEvolutionId: Constants.glaceonId)
    }
    
    // MARK: Internal Test Methods
    private func _test(expectedEvolutionId: Int) {
        let evolutionChain = pokemon?.evolutionChain ?? emptyEvolutionChain
        let expectedEvolution = evolutionChain.chain.evolvingTo.first(
            where: { $0.species.id == expectedEvolutionId }
        )
        XCTAssertNotNil(expectedEvolution)
        XCTAssertEqual(
            expectedEvolution?.details?.trigger,
            eeveeEvolutionChain.chain.evolvingTo.first(
                where: { $0.species.id == expectedEvolutionId }
            )?.details?.trigger
        )
    }
}
