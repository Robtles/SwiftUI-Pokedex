//
//  PokeAPI.swift
//
//  Created by Rob on 06/11/2023.
//

import Foundation
import Moya

// MARK: - RobbeyRoad API
/// Pokeapi.co provides all the necessary information for Pokémons
public enum PokeAPI {
    // MARK: Cases
    case pokemon(Int)
    case pokemonSpecies(Int)
}

// MARK: Moya Conformance
extension PokeAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2")!
    }
    
    public var path: String {
        return switch self {
        case .pokemon(let id):
            "pokemon/\(id)"
        case .pokemonSpecies(let id):
            "pokemon-species/\(id)"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Moya.Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
