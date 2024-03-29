//
//  PokemonMissingView.swift
//
//  Created by Rob on 11/12/2023.
//

import Defaults
import SwiftUI

// MARK: - Pokémon Missing View
/// The view displayed when trying to display a specific Pokémon but it fails.
struct PokemonMissingView: View {
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: View Properties
    var body: some View {
        ZStack {
            #if !os(watchOS)
            Colors.errorBackground.from(defaults, colorScheme: colorScheme)
            #endif
            VStack(
                alignment: .center,
                spacing: 24.0
            ) {
                Image(
                    Resources.Images.angryPikachuFace,
                    bundle: .module
                )
                .resizable()
                .frame(width: 64.0, height: 64.0)
                .scaledToFit()
                Text(
                    Strings.PokemonMissingView.information,
                    bundle: .module
                )
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.title3)
            }
            .padding()
        }
    }
}
