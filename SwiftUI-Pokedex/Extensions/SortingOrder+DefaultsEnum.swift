//
//  SortingOrder+DefaultsEnum.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
import Foundation
import Model
import UI

// MARK: - SortingOrder DefaultsEnum Conformance
extension SortingOrder: DefaultsEnum {
    // MARK: Static Properties
    public static let description: String = Strings.SortingOrder.description.localized
    public static let sortedAll: [SortingOrder] = [.byIndex, .byName]
    public static let title: String = Strings.SortingOrder.title.localized
    
    // MARK: Properties
    public var rowName: String {
        return switch self {
        case .byIndex: Strings.SortingOrder.Case.byIndex.localized
        case .byName: Strings.SortingOrder.Case.byName.localized
        }
    }
}
