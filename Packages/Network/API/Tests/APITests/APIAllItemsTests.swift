//
//  APIAllItemsTests.swift
//
//  Created by Rob on 15/11/2023.
//

import Foundation
import Model
import XCTest
@testable import API

// MARK: - API Tests: All Items
final class APIAllItemsTests: XCTestCase {
    // MARK: Constants
    private enum Constants {
        fileprivate static let itemId = 82
        fileprivate static let itemName = "Fire Stone"
    }
    
    // MARK: Properties
    private var allItems: LocalizedIndexedContentDictionary?
    
    // MARK: Test Methods
    override func setUp() async throws {
        try await super.setUp()
        allItems = try await API.shared.getAllItems()
    }
    
    func testLoadedAllPokemons() {
        XCTAssertNotNil(allItems)
        let allItems = allItems!
        XCTAssertEqual(
            allItems[Constants.itemId]?[.english], 
            Constants.itemName
        )
    }
}
