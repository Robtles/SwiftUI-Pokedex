//
//  Platform.swift
//
//  Created by Rob on 25/11/2023.
//

import Defaults
import Model
import SwiftUI

// MARK: - Platform
/// Lists the possible platforms on which the app can run
public enum Platform: CaseIterable {
    // MARK: Cases
    case iOS
    case iPadOS
    case macOS
    case tvOS
    
    // MARK: Properties
    /// Returns the current platform
    public static var current: Platform {
        #if os(iOS)
        return UIDevice.current.userInterfaceIdiom == .pad ? .iPadOS : .iOS
        #elseif os(macOS)
        return .macOS
        #elseif os(tvOS)
        return .tvOS
        #endif
    }
    
    var previewDevice: PreviewDevice {
        return PreviewDevice(rawValue: previewDeviceRawValue)
    }
    
    // MARK: Internal Properties
    private var previewDeviceRawValue: String {
        return switch self {
        case .iOS: "iPhone 15 Pro"
        case .iPadOS: "iPad Pro (12.9-inch) (6th generation)"
        case .macOS: "Mac"
        case .tvOS: "Apple TV 4K (3rd generation) (at 1080p)"
        }
    }
    
    fileprivate var previewDeviceDisplayName: String {
        return switch self {
        case .iOS: "iOS"
        case .iPadOS: "iPad OS"
        case .macOS: "macOS"
        case .tvOS: "tvOS"
        }
    }
}

// MARK: - View Extension / Device Preview
extension View {
    /// Generates a preview with the expected platform, display mode and language
    /// - Parameters:
    ///   - platform: The platform in which to watch the content
    ///   - displayMode: The display mode (light/dark)
    ///   - language: The language in which to watch the preview
    /// - Returns: The preview
    @ViewBuilder
    public func preview(
        in platform: Platform,
        displayMode: DisplayMode? = nil,
        language: Language = .english
    ) -> some View {
        switch displayMode {
        case .light, .dark:
            self.previewDevice(
                PreviewDevice(
                    rawValue: platform.previewDevice.rawValue
                )
            )
            .previewDisplayName(platform.previewDeviceDisplayName + " - " + (displayMode?.displayText ?? "Unknown platform"))
            .environment(
                displayMode == .dark ? 
                    darkUserDefaults(with: language) :
                    lightUserDefaults(with: language)
            )
        default:
            self.previewDevice(
                PreviewDevice(
                    rawValue: platform.previewDevice.rawValue
                )
            )
            .previewDisplayName(platform.previewDeviceDisplayName)
            .environment(lightUserDefaults(with: language))
        }
    }
}

// MARK: - Internal DisplayMode Extension
fileprivate extension DisplayMode {
    var displayText: String? {
        return switch self {
        case .light: "Light mode"
        case .dark: "Dark mode"
        default: nil
        }
    }
}
