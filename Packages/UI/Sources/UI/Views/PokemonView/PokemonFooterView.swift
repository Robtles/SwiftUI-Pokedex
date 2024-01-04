//
//  PokemonFooterView.swift
//
//  Created by Rob on 04/01/2024.
//

import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Pokemon View
public struct PokemonFooterView: View {
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Environment Properties
    public let pokemon: Pokemon
    
    // MARK: View Properties
    public var body: some View {
        VStack(spacing: 24.0) {
            PokemonFooterLineView(
                lineType: .baby,
                isValid: pokemon.isBaby
            )
            PokemonFooterLineView(
                lineType: .mythical,
                isValid: pokemon.isMythical
            )
            PokemonFooterLineView(
                lineType: .legendary,
                isValid: pokemon.isLegendary
            )
        }
        #if !os(watchOS)
        .foregroundStyle(
            Colors.primaryText.from(defaults, colorScheme: colorScheme)
        )
        #endif
        .padding()
    }
    
    // MARK: Init Methods
    public init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}
