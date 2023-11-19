//
//  DisplayMode.swift
//
//  Created by Rob on 19/11/2023.
//

import Foundation

// MARK: - Display Mode
/// Enumerates the possible display modes
public enum DisplayMode: String, CaseIterable {
    // MARK: Cases
    /// Forces light display mode
    case light = "light"
    /// Forces dark display mode
    case dark = "dark"
    /// Follows system display mode
    case system = "system"
}
