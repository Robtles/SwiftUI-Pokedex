//
//  SheetDestination.swift
//
//  Created by Rob on 23/11/2023.
//

import Foundation
import Model

/// The views which will be shown as sheets inside the app
public enum SheetDestination {
    /// The pokemon view, with the related Pokémon id and its localized names
    case pokemonView(id: Int, nameInformation: LocalizedContentDictionary)
}

extension SheetDestination: Identifiable {
    public var id: String {
        return switch self {
        case .pokemonView: "pokemon_view"
        }
    }
}
