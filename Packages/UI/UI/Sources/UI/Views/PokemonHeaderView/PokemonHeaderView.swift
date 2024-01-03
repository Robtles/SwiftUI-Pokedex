//
//  PokemonHeaderView.swift
//
//  Created by Rob on 16/12/2023.
//

import Defaults
import Mock
import Model
import SharedUI
import SwiftUI

// MARK: - Pokemon Header View
struct PokemonHeaderView: View {
    // MARK: Constants
    fileprivate enum Constants {
        fileprivate static let contentStackSpacing = 8.0
        fileprivate static let emptyPokemonName = "--"
        #if os(iOS) || os(macOS)
        fileprivate static let headerFont = Font.title
        #else
        fileprivate static let headerFont = Font.title3
        #endif
        fileprivate static let height = 76.0
        fileprivate static let mainStackSpacing = 12.0
    }
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    let names: LocalizedContentDictionary
    let pokemon: Pokemon
    
    // MARK: View Properties
    var body: some View {
        HStack(spacing: Constants.mainStackSpacing) {
            ImageView(
                url: URLBuilder.shared.url(
                    for: .pokemonImage,
                    pokemonId: pokemon.id.id
                )
            )
            VStack(spacing: Constants.contentStackSpacing) {
                HStack {
                    Text(names[defaults.language] ?? Constants.emptyPokemonName)
                        .font(Constants.headerFont)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            Colors.primaryText.from(defaults, colorScheme: colorScheme)
                        )
                    Text(
                        "(" +
                        "\(pokemon.id.id.formatted(withDigits: 3))" +
                        ")"
                    )
                    .offset(y: 2.0)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundStyle(
                        Colors.secondaryText.from(defaults, colorScheme: colorScheme)
                    )
                    Spacer()
                }
                PokemonBadgeTypeContainerView(
                    pokemonTypes: pokemon.types
                )
            }
            Spacer()
        }
        .frame(height: Constants.height)
        .padding()
    }
}

struct PokemonHeaderViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonHeaderView(
                    names: pikachuLocalizedNames,
                    pokemon: pikachuPokemon
                )
                .preview(in: platform, displayMode: .light)
                PokemonHeaderView(
                    names: pikachuLocalizedNames,
                    pokemon: pikachuPokemon
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
    }
}
