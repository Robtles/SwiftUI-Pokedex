//
//  PokemonBadgeTypeContainerView.swift
//
//  Created by Rob on 04/01/2024.
//

import Model
import SwiftUI

// MARK: - Pokémon Badge Type Container View
public struct PokemonBadgeTypeContainerView: View {
    // MARK: Instance Properties
    let pokemonTypes: [PokemonType]
    
    // MARK: View Properties
    public var body: some View {
        HStack(spacing: 8.0) {
            #if os(watchOS)
            Spacer()
            #endif
            ForEach(pokemonTypes, id: \.self) {
                PokemonBadgeTypeView(pokemonType: $0)
            }
            Spacer()
        }
    }
    
    // MARK: Init Methods
    public init(pokemonTypes: [PokemonType]) {
        self.pokemonTypes = pokemonTypes
    }
}
