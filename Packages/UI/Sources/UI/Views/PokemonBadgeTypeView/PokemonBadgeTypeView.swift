//
//  PokemonBadgeTypeView.swift
//
//  Created by Rob on 16/12/2023.
//

import Model
import SwiftUI

// MARK: - Pokémon Badge Type View
struct PokemonBadgeTypeView: View {
    // MARK: Type Properties
    private enum Constants {
        #if os(iOS) || os(macOS)
        fileprivate static let badgeWidth: CGFloat = 100.0
        #else
        fileprivate static let badgeWidth: CGFloat = 200.0
        #endif
    }
    
    // MARK: Instance Properties
    let pokemonType: PokemonType
    
    // MARK: View Properties
    var body: some View {
        Text(
            Strings.PokemonType.for(pokemonType),
            bundle: .module
        )
        .foregroundStyle(pokemonType.textColor)
        .textCase(.uppercase)
        .font(.subheadline)
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
}

struct PokemonBadgeTypeViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                VStack(spacing: 8.0) {
                    ForEach(PokemonType.allCases, id: \.self) { pokemonType in
                        PokemonBadgeTypeView(pokemonType: pokemonType)
                    }
                }
                .preview(in: platform, displayMode: .light)
            }
        }
    }
}
