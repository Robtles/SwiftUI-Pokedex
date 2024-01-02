//
//  PokemonStatContainerView.swift
//
//  Created by Rob on 22/12/2023.
//

import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Pokémon Stat Container View
struct PokemonStatContainerView: View {
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    private let pokemon: Pokemon
    
    // MARK: View Properties
    var body: some View {
        VStack(spacing: 16.0) {
            ForEach(PokemonStat.allCases, id: \.self) {
                PokemonStatView(pokemon: pokemon, stat: $0)
            }
        }
        .foregroundStyle(
            Colors.primaryText.from(defaults, colorScheme: colorScheme)
        )
        .padding()
    }

    // MARK: Init Methods
    init(
        pokemon: Pokemon
    ) {
        self.pokemon = pokemon
    }
}

struct PokemonStatContainerViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                VStack(spacing: 16.0) {
                    ForEach(PokemonStat.allCases, id: \.self) { stat in
                        PokemonStatView(
                            pokemon: pikachuPokemon,
                            stat: stat
                        )
                    }
                }
                .preview(in: platform, displayMode: .light)
                VStack(spacing: 16.0) {
                    ForEach(PokemonStat.allCases, id: \.self) { stat in
                        PokemonStatView(
                            pokemon: pikachuPokemon,
                            stat: stat
                        )
                    }
                }
                .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
