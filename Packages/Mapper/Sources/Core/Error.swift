//
//  Error.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: Mapper Errors
public enum MapperError: Error {
    // MARK: Cases
    /// When Pokémon initialization fails because of a wrong evolution chain
    case evolutionChainFailed
    /// When an ID could not be found in the decoded response
    case idNotFound(String?)
    /// When Pokémon initialization fails
    case pokemonInitializationFailed
    
    // MARK: Properties
    private var defaultMessage: String {
        return switch self {
        case .evolutionChainFailed:
            "Evolution chain failed"
        case .idNotFound:
            "No ID was found"
        case .pokemonInitializationFailed:
            "Pokemon initialization failed"
        }
    }
}

extension MapperError: LocalizedError {
    public var errorDescription: String? {
        return switch self {
        case .idNotFound(let customMessage):
            customMessage ?? defaultMessage
        default:
            defaultMessage
        }
    }
}
