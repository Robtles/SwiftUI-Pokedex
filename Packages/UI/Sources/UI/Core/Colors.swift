//
//  Colors.swift
//
//  Created by Rob on 27/11/2023.
//

import Defaults
import SwiftUI

// MARK: - Colors
/// The app colors
enum Colors {
    // MARK: Cases
    case primaryBackground
    case primaryText
    case secondaryBackground
    case secondaryText
    
    // MARK: Internal Properties
    fileprivate var hexDarkColor: UInt {
        return switch self {
        case .primaryBackground: 0x000000
        case .primaryText: 0xEDEDED
        case .secondaryBackground: 0xDBDBDB
        case .secondaryText: 0xD1D1D1
        }
    }
    
    fileprivate var hexLightColor: UInt {
        return switch self {
        case .primaryBackground: 0xFFFFFF
        case .primaryText: 0x1C1C1C
        case .secondaryBackground: 0xC2C2C2
        case .secondaryText: 0x4A4A4A
        }
    }

    // MARK: Exposed Methods
    func from(
        _ defaults: Defaults,
        colorScheme: ColorScheme
    ) -> Color {
        let lightColor = Color(hex: hexLightColor)
        let darkColor = Color(hex: hexDarkColor)
        return switch defaults.displayMode {
        case .light: lightColor
        case .dark: darkColor
        case .system: colorScheme == .dark ? darkColor : lightColor
        }
    }
}
