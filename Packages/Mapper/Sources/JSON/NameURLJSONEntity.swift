//
//  NameURLJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: Name/URL Tuple
struct NameURLJSONEntity: URLJSONEntityProtocol {
    // MARK: Properties
    let name: String
    let url: String
}
