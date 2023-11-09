//
//  RobbeyRoad.swift
//
//  Created by Rob on 06/11/2023.
//

import Foundation
import Moya

// MARK: - RobbeyRoad API
/// The API provides the base list of localized Pokémon names, since Pokeapi.co API is not able to do it
public enum RobbeyRoad {
    // MARK: Cases
    case pokemons
}

// MARK: Moya Conformance
extension RobbeyRoad: TargetType {
    public var baseURL: URL {
        return URL(string: "https://www.robbeyroad.com/api")!
    }
    
    public var path: String {
        return "pokemons.json"
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
