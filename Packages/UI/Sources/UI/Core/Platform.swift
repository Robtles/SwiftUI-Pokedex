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
}
