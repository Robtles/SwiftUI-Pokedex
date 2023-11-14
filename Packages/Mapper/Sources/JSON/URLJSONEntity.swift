//
//  URLJSONEntity.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation

// MARK: - JSON Representation: URL
protocol URLJSONEntityProtocol: Decodable {
    // MARK: Properties
    var url: String { get }
}

extension URLJSONEntityProtocol {
    /// `id` extracted from the URL
    var id: Int? {
        guard let _url = URL(string: url) else { return nil }
        return Int(_url.lastPathComponent)
    }
}

struct URLJSONEntity: URLJSONEntityProtocol {
    // MARK: Properties
    let url: String
}
