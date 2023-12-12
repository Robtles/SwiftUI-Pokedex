//
//  LoadingView.swift
//
//  Created by Rob on 27/11/2023.
//

import Defaults
import SwiftUI

// MARK: - Loading View
/// The initial loading view
public struct LoadingView: View {
    // MARK: Constants
    private enum Constants {
        fileprivate static var animatedPokeballWidth: CGFloat = switch Platform.current {
        case .iOS: 100.0
        case .iPadOS, .macOS, .tvOS: 180.0
        }
    }
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: View Properties
    public var body: some View {
        ZStack {
            Colors.primaryBackground.from(defaults, colorScheme: colorScheme)
            #if os(macOS)
            GIFImage(
                name: Resources.Images.animatedPokeball,
                macOSSize: CGSize(
                    width: Constants.animatedPokeballWidth,
                    height: Constants.animatedPokeballWidth
                )
            )
            .frame(
                width: Constants.animatedPokeballWidth,
                height: Constants.animatedPokeballWidth
            )
            #else
            GIFImage(
                name: Resources.Images.animatedPokeball
            )
            .frame(
                width: Constants.animatedPokeballWidth,
                height: Constants.animatedPokeballWidth
            )
            #endif
        }
    }
    
    // MARK: Init Methods
    public init() {}
}

struct LoadingViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) {
                LoadingView()
                    .preview(in: $0)
            }
        }
    }
}
