//
//  SortingOrder.swift
//
//  Created by Rob on 19/11/2023.
//

import Foundation

// MARK: - Sorting Order
/// Enumerates the possible Pokédex list sorting orders
public enum SortingOrder: String, CaseIterable {
    // MARK: Cases
    /// Sorts the list by Pokédex index
    case byIndex = "by_index"
    /// Sorts the list by Pokémon names
    case byName = "by_name"
    /// Sorts the list by Pokémon types, themselves alphabetically sorted
    case byType = "by_type"
}
