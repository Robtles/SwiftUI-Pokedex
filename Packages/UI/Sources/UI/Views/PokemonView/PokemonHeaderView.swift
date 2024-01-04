//
//  PokemonHeaderView.swift
//
//  Created by Rob on 04/01/2024.
//

import Defaults
import Model
import SwiftUI

// MARK: - Pokemon Header View
public struct PokemonHeaderView: View {
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
    public var body: some View {
        #if os(watchOS)
        VStack {
            ImageView(
                url: URLBuilder.shared.url(
                    for: .pokemonImage,
                    pokemonId: pokemon.id.id
                )
            )
            .frame(width: 64.0, height: 64.0)
            Text(names[defaults.language] ?? Constants.emptyPokemonName)
                .font(Constants.headerFont)
                .fontWeight(.bold)
                .foregroundStyle(
                    Colors.primaryText.from(defaults, colorScheme: colorScheme)
                )
            PokemonBadgeTypeContainerView(
                pokemonTypes: pokemon.types
            )
        }
        #else
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
        #endif
    }
    
    // MARK: Init Methods
    public init(
        names: LocalizedContentDictionary,
        pokemon: Pokemon
    ) {
        self.names = names
        self.pokemon = pokemon
    }
}
