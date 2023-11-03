//
//  ID.swift
//
//  Created by Rob on 29/10/2023.
//

import Foundation

// MARK: - Phantom Typed ID
/// Allows adding an identifier to a type, but preventing comparison between different types
public struct ID<PhantomType>: ExpressibleByIntegerLiteral, Equatable {
    // MARK: Properties
    /// The underlying integer ID
    let id: Int
    
    // MARK: Init Methods
    public init(integerLiteral value: Int) {
        self.id = value
    }
}

// MARK: - Identifiable Type
/// Enumerates all the identifiable types
public enum IdentifiableType {
    public enum EvolutionChain {}
    public enum Item {}
    public enum Pokemon {}
    public enum Version {}
}
