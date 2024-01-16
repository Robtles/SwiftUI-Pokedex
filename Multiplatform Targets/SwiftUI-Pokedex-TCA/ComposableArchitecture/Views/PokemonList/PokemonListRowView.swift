//
//  PokemonListRowView.swift
//
//  Created by Rob on 25/11/2023.
//

import Defaults
import Mock
import Model
import UI
import SwiftUI

// MARK: - Pokemon List Row View
/// The row view of the Pokémon list
public struct PokemonListRowView: View {
    // MARK: Constants
    fileprivate enum Constants {
        fileprivate static let emptyPokemonName = "--"
        fileprivate static let numberPrefix = "#"
        
        fileprivate static var rowHeight: CGFloat = switch Platform.current {
        case .iOS: 76.0
        case .iPadOS, .macOS: 92.0
        case .tvOS: 124.0
        case .watchOS: 50.0
        }
        
        fileprivate static var vStackSpacing: CGFloat = switch Platform.current {
        case .iOS: 2.0
        case .iPadOS, .macOS, .tvOS: 8.0
        case .watchOS: 4.0
        }
    }
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Properties
    /// The Pokémon id
    let id: Int
    /// The Pokémon localized names
    let localizedNames: LocalizedContentDictionary
    
    // MARK: View Properties
    public var body: some View {
        HStack(spacing: 16.0) {
            VStack(alignment: .leading, spacing: Constants.vStackSpacing) {
                Text(PokemonListRowView.Constants.numberPrefix + id.formatted(withDigits: 3))
                    .font(.body)
                    .foregroundStyle(
                        Colors.primaryText.from(defaults, colorScheme: colorScheme)
                    )
                Text(localizedNames[defaults.language] ?? Constants.emptyPokemonName)
                    .font(.headline)
                    .foregroundStyle(
                        Colors.secondaryText.from(defaults, colorScheme: colorScheme)
                    )
            }
            .padding()
            Spacer()
            ClippedImageView(
                url: URLBuilder.shared.url(
                    for: .pokedexListImage,
                    pokemonId: id
                )
            )
            .frame(height: Constants.rowHeight)
        }
        .padding()
        .frame(height: Constants.rowHeight)
        .background(
            Colors.primaryBackground.from(defaults, colorScheme: colorScheme)
        )
    }
}
