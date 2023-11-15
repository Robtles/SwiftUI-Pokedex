//
//  PokeApi.swift
//
//  Created by Rob on 06/11/2023.
//

import Foundation
import Moya

// MARK: - PokeApi Provider
/// Pokeapi.co provides all the necessary information for Pokémons
public enum PokeApi {
    // MARK: Cases
    case evolutionChain(Int)
    case pokemon(Int)
    case pokemonSpecies(Int)
    case version(Int)
}

// MARK: Moya Conformance
extension PokeApi: TargetType {
    public var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2")!
    }
    
    public var path: String {
        return switch self {
        case .evolutionChain(let id):
            "evolution-chain/\(id)"
        case .pokemon(let id):
            "pokemon/\(id)"
        case .pokemonSpecies(let id):
            "pokemon-species/\(id)"
        case .version(let id):
            "version/\(id)"
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
