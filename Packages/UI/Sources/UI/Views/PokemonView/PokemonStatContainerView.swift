//
//  PokemonStatContainerView.swift
//
//  Created by Rob on 04/01/2024.
//

import Defaults
import Model
import SwiftUI

public struct PokemonStatContainerView: View {
    // MARK: Type Properties
    private enum Constants {
        #if os(watchOS)
        fileprivate static let spacing = 4.0
        #else
        fileprivate static let spacing = 16.0
        #endif
    }
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) private var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    private let pokemon: Pokemon
    
    // MARK: View Properties
    public var body: some View {
        VStack(spacing: Constants.spacing) {
            ForEach(PokemonStat.allCases, id: \.self) {
                PokemonStatView(pokemon: pokemon, stat: $0)
            }
        }
        #if !os(watchOS)
        .foregroundStyle(
            Colors.primaryText.from(defaults, colorScheme: colorScheme)
        )
        #endif
        .padding()
    }

    // MARK: Init Methods
    public init(
        pokemon: Pokemon
    ) {
        self.pokemon = pokemon
    }
}
