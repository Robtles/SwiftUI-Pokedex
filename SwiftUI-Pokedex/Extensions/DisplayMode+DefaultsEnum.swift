//
//  DisplayMode+DefaultsEnum.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
import Foundation
import Model

// MARK: - DisplayMode DefaultsEnum Conformance
extension DisplayMode: DefaultsEnum {
    // MARK: Static Properties
    public static let description: String = "Either forces the light or dark mode, or follows the current system mode."
    public static let sortedAll: [DisplayMode] = [.light, .dark, .system]
    public static let title: String = "Display mode"
    
    // MARK: Properties
    public var rowName: String {
        return switch self {
        case .dark: "Dark mode"
        case .light: "Light mode"
        case .system: "Follows system"
        }
    }
}
