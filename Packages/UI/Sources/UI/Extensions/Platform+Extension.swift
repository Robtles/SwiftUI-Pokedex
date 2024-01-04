//
//  Platform+Extension.swift
//
//  Created by Rob on 04/01/2024.
//

import Foundation

extension CGFloat {
    static func `for`(
        iOS: CGFloat,
        iPadOS: CGFloat,
        tvOS: CGFloat,
        macOS: CGFloat,
        watchOS: CGFloat
    ) -> CGFloat {
        return switch Platform.current {
        case .iOS: iOS
        case .iPadOS: iPadOS
        case .tvOS: tvOS
        case .macOS: macOS
        case .watchOS: watchOS
        }
    }
}

extension Double {
    static func `for`(
        iOS: Double,
        iPadOS: Double,
        tvOS: Double,
        macOS: Double,
        watchOS: Double
    ) -> Double {
        return switch Platform.current {
        case .iOS: iOS
        case .iPadOS: iPadOS
        case .tvOS: tvOS
        case .macOS: macOS
        case .watchOS: watchOS
        }
    }
}
