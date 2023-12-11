//
//  PokedexAppModel.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 11/12/2023.
//

import Model
import SwiftUI

// MARK: - App Model
/// The app model
@Observable final class PokedexAppModel {
    // MARK: Properties
    /// The fetched Pokémon information
    var pokemons: [Int: Pokemon] = [:]
    /// The Pokémon games versions
    var versions: [Version] = []
}
