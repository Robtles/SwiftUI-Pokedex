//
//  RobbeyRoad.swift
//
//  Created by Rob on 06/11/2023.
//

import Foundation
import Moya

// MARK: - RobbeyRoad Provider
/// The API provides the base list of localized Pokémon and items names, since Pokeapi.co API is not able to do it easily
public enum RobbeyRoad {
    // MARK: Cases
    case items
    case pokemons
}

// MARK: Moya Conformance
extension RobbeyRoad: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.robbeyroad.com/api")!
    }
    
    public var path: String {
        return switch self {
        case .items: "items.json"
        case .pokemons: "pokemons.json"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Moya.Task {
        return .requestPlain
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
