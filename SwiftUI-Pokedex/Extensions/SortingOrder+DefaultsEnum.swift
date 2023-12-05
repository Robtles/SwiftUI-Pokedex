//
//  SortingOrder+DefaultsEnum.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
import Foundation
import Model

// MARK: - SortingOrder DefaultsEnum Conformance
extension SortingOrder: DefaultsEnum {
    // MARK: Static Properties
    public static let description: String = "Defines the Pokédex sorting order: by index or name"
    public static let sortedAll: [SortingOrder] = [.byIndex, .byName]
    public static let title: String = "SortingOrder"
    
    // MARK: Properties
    public var rowName: String {
        return switch self {
        case .byIndex: "By index"
        case .byName: "By name"
        }
    }
}
