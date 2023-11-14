//
//  PokemonTest.swift
//
//  Created by Rob on 13/11/2023.
//

import Foundation

// MARK: - Enumerating Test Pokémons
enum PokemonFamily {
    // MARK: Cases
    case bellsprout
    case gastly
    case nincada
    case onix
    case pikachu
    
    // MARK: Properties
    var evolutionChainId: Int {
        return switch self {
        case .bellsprout: 29
        case .gastly: 40
        case .nincada: 144
        case .onix: 41
        case .pikachu: 10
        }
    }
    
    var pokemonId: Int {
        return switch self {
        case .bellsprout: 69
        case .gastly: 92
        case .nincada: 290
        case .onix: 95
        case .pikachu: 25
        }
    }
}
