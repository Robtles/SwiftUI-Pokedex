//
//  FlavorTextJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: FlavorText
struct FlavorTextJSONEntity: Decodable {
    // MARK: Properties
    let flavorText: String
    let language: NameURLJSONEntity
    let version: NameURLJSONEntity
}
