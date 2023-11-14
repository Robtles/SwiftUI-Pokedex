//
//  MapperTestError.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation

// MARK: - Mapper Test Errors
enum MapperTestError: LocalizedError {
    // MARK: Cases
    case urlNotFound(message: String)
    case dataFailed(message: String)
}

// MARK: Error Description
extension MapperTestError {
    var errorDescription: String? {
        return switch self {
        case .dataFailed(let message), .urlNotFound(let message): message
        }
    }
}
