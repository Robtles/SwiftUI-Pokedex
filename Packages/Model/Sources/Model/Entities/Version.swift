//
//  Version.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Version
/// Information about a game version
public struct Version {
    // MARK: Static & Constants
    /// The constants related to the Version model
    public enum Constants {
        /// The valid Pokémon game versions (from the 4 first generations)
        public static let validVersions = (red...soulSilver).map { $0 } + [omegaRuby, alphaSapphire]
    }
    
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

// MARK: - Version Index
/// List of all the versions with their corresponding index from PokéAPI
public extension Version {
    static let red = 1
    static let blue = 2
    static let yellow = 3
    static let gold = 4
    static let silver = 5
    static let crystal = 6
    static let ruby = 7
    static let sapphire = 8
    static let emerald = 9
    static let fireRed = 10
    static let leafGreen = 11
    static let diamond = 12
    static let pearl = 13
    static let platinum = 14
    static let heartGold = 15
    static let soulSilver = 16
    static let omegaRuby = 25
    static let alphaSapphire = 26
}
