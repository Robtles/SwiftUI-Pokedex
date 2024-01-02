//
//  PokemonHeaderView~iOS.swift
//
//  Created by Rob on 16/12/2023.
//

import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Pokemon Header View (iPhone & iPad)
struct PokemonHeaderView_iOS: View {
    // MARK: Constants
    fileprivate enum Constants {
        fileprivate static let contentStackSpacing = 8.0
        fileprivate static let emptyPokemonName = "--"
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
                        .font(.title)
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

struct PokemonHeaderView_iPhonePreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach([Platform.iOS, .iPadOS], id: \.self) {
                PokemonHeaderView_iOS(
                    names: pikachuLocalizedNames,
                    pokemon: pikachuPokemon
                )
                .preview(in: $0, displayMode: .light)
                PokemonHeaderView_iOS(
                    names: pikachuLocalizedNames,
                    pokemon: pikachuPokemon
                )
                .preview(in: $0, displayMode: .dark)
            }
        }
    }
}
