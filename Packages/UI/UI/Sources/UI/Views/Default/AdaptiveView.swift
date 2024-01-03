//
//  AdaptiveView.swift
//
//  Created by Rob on 25/11/2023.
//

import SwiftUI

// MARK: - Adaptive View
/// Represents a view adapted to the current platform
public struct AdaptiveView: View {
    // MARK: Internal Properties
    private let content: any View
    
    // MARK: Init Methods
    public init(
        iOS: any View, 
        iPadOS: any View,
        macOS: any View,
        tvOS: any View
    ) {
        switch Platform.current {
        case .iOS:
            content = iOS
        case .iPadOS:
            content = iPadOS
        case .macOS:
            content = macOS
        case .tvOS:
            content = tvOS
        }
    }

    // MARK: View Properties
    public var body: some View {
        return AnyView(content)
    }
}
