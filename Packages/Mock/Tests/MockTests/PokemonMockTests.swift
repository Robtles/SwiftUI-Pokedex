import XCTest
import Model
@testable import Mock

final class PokemonMockTests: XCTestCase {
    // MARK: Test Methods
    func testBellsproutPokemonNotNil() {
        XCTAssertNotNil(bellsproutPokemon)
    }
    
    func testEeveePokemonNotNil() {
        XCTAssertNotNil(eeveePokemon)
    }
    
    func testPikachuPokemonNotNil() {
        XCTAssertNotNil(pikachuPokemon)
    }
}
