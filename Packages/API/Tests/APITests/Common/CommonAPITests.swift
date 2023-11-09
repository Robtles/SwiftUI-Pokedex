//
//  CommonAPITests.swift
//
//  Created by Rob on 07/11/2023.
//

import API
import Foundation
import Moya
import XCTest

// MARK: - Common API Tests
class CommonAPITests<T: TargetType>: XCTestCase {
    // MARK: Properties
    var provider: MoyaProvider<T>!
    
    // MARK: Test Methods
    override func setUp() {
        super.setUp()
        provider = MoyaProvider<T>()
    }
    
    override func tearDown() {
        super.tearDown()
        provider = nil
    }
}

// MARK: - Moya Provider Extension
extension MoyaProvider {
    /// Tests if the server is reachable, by checking that the target HTTP result code is 200 (ok)
    /// - Parameter target: The target used to test that the server is reachable
    /// - Returns: True if the HTTP status code is 200 (ok)
    func testServerReachable(for target: Target) async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response.statusCode == HTTPStatusCode.ok.rawValue)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
