//
//  Version.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Version
/// Information about a game version
public struct Version {
    // MARK: Properties
    /// The version unique id
    public let id: ID<IdentifiableType.Version>
    /// The localized version names
    public let names: LocalizedContentDictionary
    
    // MARK: Init Methods
    public init(
        id: ID<IdentifiableType.Version>, 
        names: LocalizedContentDictionary
    ) {
        self.id = id
        self.names = names
    }
}

extension Version: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id.id)
    }
}
