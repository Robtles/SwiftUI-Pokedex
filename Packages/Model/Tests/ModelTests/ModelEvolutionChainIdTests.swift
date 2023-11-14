import XCTest
@testable import Model

final class ModelEvolutionChainIdTests: XCTestCase {
    // MARK: Constants
    private enum Constants {
        fileprivate static let validPokemon: ID<IdentifiableType.Pokemon> = 1
        fileprivate static let invalidPokemon: ID<IdentifiableType.Pokemon> = 10000
    }
    
    // MARK: Test Methods
    func testEvolutionChainContainsValidPokemonId() {
        XCTAssertTrue(evolutionChain.chain.evolvingTo.contains { $0.species == Constants.validPokemon }, "Evolution chain should contain the valid Pokémon id")
    }
    
    func testEvolutionChainNotContainsInvalidPokemonId() {
        XCTAssertFalse(evolutionChain.chain.evolvingTo.contains { $0.species == Constants.invalidPokemon }, "Evolution chain should not contain the invalid Pokémon id")
    }
    
    // MARK: Internal
    /// The tested evolution chain
    private lazy var evolutionChain: EvolutionChain = {
        return EvolutionChain(
            id: 1,
            chain: EvolutionChainLink(
                details: evolutionDetails,
                evolvingTo: [
                    EvolutionChainLink(
                        details: evolutionDetails,
                        evolvingTo: [],
                        speciesId: Constants.validPokemon
                    ),
                    EvolutionChainLink(
                        details: evolutionDetails,
                        evolvingTo: [],
                        speciesId: Constants.invalidPokemon
                    )
                ],
                speciesId: 1
            )
        )
    }()
    
    /// The tested evolution chain's details
    private lazy var evolutionDetails: EvolutionDetails = {
        return EvolutionDetails(
            heldItem: nil,
            timeOfDay: nil,
            trigger: .trade
        )
    }()
}
