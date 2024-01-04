//
//  PokemonBadgeTypeView.swift
//
//  Created by Rob on 04/01/2024.
//

import Model
import SwiftUI

// MARK: - Pokémon Badge Type View
public struct PokemonBadgeTypeView: View {
    // MARK: Type Properties
    private enum Constants {
        #if os(iOS) || os(macOS)
        fileprivate static let badgeWidth: CGFloat = 100.0
        #elseif os(watchOS)
        fileprivate static let badgeWidth: CGFloat = 70.0
        #else
        fileprivate static let badgeWidth: CGFloat = 200.0
        #endif
    }
    
    // MARK: Instance Properties
    let pokemonType: PokemonType
    
    // MARK: View Properties
    public var body: some View {
        Text(
            Strings.PokemonType.for(pokemonType),
            bundle: .module
        )
        #if !os(watchOS)
        .foregroundStyle(pokemonType.textColor)
        #endif
        .textCase(.uppercase)
        #if !os(watchOS)
        .font(.subheadline)
        #else
        .font(.footnote)
        #endif
        .fontWeight(.bold)
        .frame(width: Constants.badgeWidth, height: 30)
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(pokemonType.backgroundColor)
                .strokeBorder(
                    pokemonType.borderColor,
                    lineWidth: 1.0
                )
        )
    }
    
    // MARK: Init Methods
    public init(pokemonType: PokemonType) {
        self.pokemonType = pokemonType
    }
}
