//
//  APIVersionTests.swift
//
//  Created by Rob on 15/11/2023.
//

import Foundation
import Model
import XCTest
@testable import API

// MARK: - API Tests: Version
final class APIVersionTests: XCTestCase {
    // MARK: Test Methods
    func testVersions() async throws {
        let versions = try await API.shared.getAllVersions()
        XCTAssertEqual(versions.count, Version.Constants.validVersions.count)
        XCTAssertEqual(versions.first { $0.id == 1 }?.names[.english], "Red")
    }
}
