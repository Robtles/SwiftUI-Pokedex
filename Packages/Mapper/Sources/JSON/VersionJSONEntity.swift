//
//  VersionJSONEntity.swift
//
//  Created by Rob on 15/11/2023.
//

import Foundation

// MARK: - JSON Representation: Version
struct VersionJSONEntity: Decodable {
    // MARK: Properties
    let names: [VersionNameJSONEntity]
}

// MARK: - JSON Representation: Version Name
struct VersionNameJSONEntity: Decodable {
    let language: NameURLJSONEntity
    let name: String
}
