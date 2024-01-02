//
//  PokemonFooterView.swift
//
//  Created by Rob on 16/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokemon View
public struct PokemonFooterView: View {
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
        .padding()
    }
}

struct PokemonFooterViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonFooterView(pokemon: pikachuPokemon)
                    .preview(in: platform, displayMode: .light)
                PokemonFooterView(pokemon: pikachuPokemon)
                    .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
