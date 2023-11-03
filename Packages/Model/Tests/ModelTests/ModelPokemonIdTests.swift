import XCTest
@testable import Model

final class ModelPokemonIdTests: XCTestCase {
    // MARK: Test Methods
    /// Tries to create a Pokémon with an id that should be accepted
    func testPokemonWithPossibleId() {
        XCTAssertNotNil(createFakePokemon(withId: 10))
    }
    
    /// Tries to create a Pokémon with an id that should not be accepted
    func testPokemonWithImpossibleId() {
        XCTAssertNil(createFakePokemon(withId: 1000))
    }
    
    // MARK: Test Making
    /// Creates a fake Pokémon in order to test its ID
    /// - Parameter id: The fake Pokémon id
    /// - Returns: The created Pokémon, or nil if ID is not expected
    private func createFakePokemon(withId id: ID<IdentifiableType.Pokemon>) -> Pokemon? {
        return Pokemon(
            id: id,
            types: [],
            weight: 0,
            height: 0,
            stats: [:],
            baseHappiness: 0,
            captureRate: 0,
            evolutionChain: EvolutionChain(
                id: 1,
                chain: EvolutionChainLink(
                    details: EvolutionDetails(
                        heldItem: nil,
                        item: nil,
                        timeOfDay: nil,
                        trigger: .shed
                    ),
                    evolvingTo: [],
                    id: 10
                )
            ),
            textEntries: [:],
            isBaby: false,
            isLegendary: false,
            isMythical: false
        )
    }
}
