//
//  PokemonViewSpacer.swift
//
//  Created by Rob on 04/01/2024.
//

import SwiftUI

// MARK: - Pokemon View Spacer
public struct PokemonViewSpacer: View {
    // MARK: Type Properties
    private enum Constants {
        fileprivate static let height = 1.0
        fileprivate static let opacity = 0.3
        fileprivate static let horizontalPadding = 24.0
        #if os(watchOS)
        fileprivate static let verticalPadding = 12.0
        #else
        fileprivate static let verticalPadding = 4.0
        #endif
    }
    
    // MARK: View Properties
    public var body: some View {
        Color.gray
            .opacity(Constants.opacity)
            .frame(height: Constants.height)
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.vertical, Constants.verticalPadding)
    }
    
    // MARK: Init Methods
    public init() {}
}
