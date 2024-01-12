//
//  SheetDestination.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Foundation
import Model

/// The views which will be shown as sheets inside the app
public enum SheetDestination {
    /// The pokemon view, with the related Pokémon information and its localized names
    case pokemonView(
        nameInformation: LocalizedContentDictionary, 
        pokemon: Pokemon
    )
}

extension SheetDestination: Identifiable {
    public var id: String {
        return switch self {
        case .pokemonView: "pokemon_view"
        }
    }
}
