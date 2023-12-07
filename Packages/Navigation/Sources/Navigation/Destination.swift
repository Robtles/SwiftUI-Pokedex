//
//  Destination.swift
//
//  Created by Rob on 23/11/2023.
//

import Defaults
import Foundation

/// The navigation possible destinations of the app, in `UINavigation` style.
/// Which means, sheet views won't appear in here.
public enum Destination {
    /// The settings view
    case settings
    #if os(tvOS)
    /// The settings selection view (this one is specific to tvOS)
    case settingsSelection(any DefaultsEnum)
    #endif
}

extension Destination: Hashable {
    public static func == (lhs: Destination, rhs: Destination) -> Bool {
        return switch (lhs, rhs) {
        case (.settings, .settings):
            true
        #if os(tvOS)
        case (.settingsSelection, .settingsSelection):
            true
        default:
            false
        #endif
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self)
    }
}
