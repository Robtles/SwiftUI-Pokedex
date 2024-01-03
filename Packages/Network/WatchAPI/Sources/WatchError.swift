//
//  Error.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Foundation

// MARK: Mapper Errors
public enum WatchError: Error {
    // MARK: Cases
    /// When JSON file was not found in main bundle
    case jsonNotFound(String)
    
    // MARK: Properties
    private var defaultMessage: String {
        return switch self {
        case .jsonNotFound(let name):
            "\(name).json not found in Main.bundle"
        }
    }
}

extension WatchError: LocalizedError {
    public var errorDescription: String? {
        return defaultMessage
    }
}
