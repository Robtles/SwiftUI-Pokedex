//
//  DisplayMode+DefaultsEnum.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
import Foundation
import Model
import SwiftUI
import UI

// MARK: - DisplayMode DefaultsEnum Conformance
extension DisplayMode: DefaultsEnum {
    // MARK: Static Properties
    public static let description: String = Strings.DisplayMode.description.localized
    public static let sortedAll: [DisplayMode] = [.light, .dark, .system]
    public static let title: String = Strings.DisplayMode.title.localized
    
    // MARK: Properties
    public var rowName: String {
        return switch self {
        case .dark: Strings.DisplayMode.Mode.dark.localized
        case .light: Strings.DisplayMode.Mode.light.localized
        case .system: Strings.DisplayMode.Mode.system.localized
        }
    }
}
