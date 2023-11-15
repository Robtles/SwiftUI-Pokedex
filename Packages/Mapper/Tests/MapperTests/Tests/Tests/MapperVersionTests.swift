//
//  MapperVersionTests.swift
//
//  Created by Rob on 15/11/2023.
//

import Foundation
import Model
import XCTest
@testable import Mapper

// MARK: - Mapper Tests: Version
final class MapperVersionTests: XCTestCase {
    // MARK: Constants
    private enum Constants {
        fileprivate static let versionFileName = "version_\(Constants.versionId)"
        fileprivate static let versionId = 1
        fileprivate static let versionExpectedEnglishFilename = "Red"
    }

    // MARK: Test Methods
    func testVersion() throws {
        let versionData = try getData(for: Constants.versionFileName)
        XCTAssertNoThrow(versionData)
        let version = try Mapper.shared.mapToVersion(
            id: Constants.versionId,
            with: versionData
        )
        XCTAssertNoThrow(version)
        XCTAssertEqual(version.names[.english], Constants.versionExpectedEnglishFilename)
    }
}
