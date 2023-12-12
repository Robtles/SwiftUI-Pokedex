//
//  AppModel.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 11/12/2023.
//

import SwiftUI

// MARK: - App Model
/// The app model
@Observable public final class AppModel {
    // MARK: Properties
    /// The fetched Pokémon information
    public var pokemons: [Int: Pokemon]
    /// The Pokémon games versions
    public var versions: [Version]
    
    // MARK: Init Methods
    public init() {
        pokemons = [:]
        versions = []
    }
}
