//
//  Colors.swift
//
//  Created by Rob on 27/11/2023.
//

import Defaults
import SwiftUI

// MARK: - Colors
/// The app colors
public enum Colors {
    // MARK: Cases
    case errorBackground
    case highlightedText
    case pickerFocusedText
    case primaryBackground
    case primaryText
    case secondaryBackground
    case secondaryText
    
    // MARK: Internal Properties
    fileprivate var darkColorHexString: String {
        return switch self {
        case .errorBackground: "1C1C1C"
        case .highlightedText: "007AFF"
        case .pickerFocusedText: "000000"
        case .primaryBackground: "000000"
        case .primaryText: "EDEDED"
        case .secondaryBackground: "DBDBDB"
        case .secondaryText: "D1D1D1"
        }
    }
    
    fileprivate var lightColorHexString: String {
        return switch self {
        case .errorBackground: "BD0D00"
        case .highlightedText: "007AFF"
        case .pickerFocusedText: "1C1C1C"
        case .primaryBackground: "FFFFFF"
        case .primaryText: "1C1C1C"
        case .secondaryBackground: "C2C2C2"
        case .secondaryText: "4A4A4A"
        }
    }

    // MARK: Exposed Methods
    public func from(
        _ defaults: Defaults,
        colorScheme: ColorScheme
    ) -> Color {
        let lightColor = Color(hex: lightColorHexString)
        let darkColor = Color(hex: darkColorHexString)
        return switch defaults.displayMode {
        case .light: lightColor
        case .dark: darkColor
        case .system: colorScheme == .dark ? darkColor : lightColor
        }
    }
}
