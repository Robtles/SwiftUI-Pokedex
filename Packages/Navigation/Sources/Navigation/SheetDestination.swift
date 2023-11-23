//
//  SheetDestination.swift
//
//  Created by Rob on 23/11/2023.
//

import Foundation

/// The views which will be shown as sheets inside the app
public enum SheetDestination {
    /// The pokemon view, with the related Pokémon id
    case pokemonView(id: Int)
}
