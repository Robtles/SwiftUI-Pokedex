//
//  Platform.swift
//
//  Created by Rob on 25/11/2023.
//

import SwiftUI

// MARK: - Platform
/// Lists the possible platforms on which the app can run
public enum Platform {
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
}

// MARK: - View Extension / Device Preview
extension View {
    func preview(in platform: Platform) -> some View {
        return previewDevice(
            PreviewDevice(rawValue: platform.previewDevice.rawValue)
        )
    }
}
