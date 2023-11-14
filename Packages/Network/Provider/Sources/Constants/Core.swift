//
//  Core.swift
//
//  Created by Rob on 08/11/2023.
//

import Foundation
import Moya

// MARK: - Moya Provider Extension
public extension MoyaProvider {
    /// Tries to fetch data from the API
    /// - Parameter target: The target to call
    /// - Returns: The response as Data, not mapped yet
    func getData(for target: Target) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response.data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
