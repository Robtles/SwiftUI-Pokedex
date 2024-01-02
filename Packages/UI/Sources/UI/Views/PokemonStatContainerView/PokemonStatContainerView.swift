//
//  PokemonStatContainerView.swift
//
//  Created by Rob on 22/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokémon Stat Container View
struct PokemonStatContainerView: View {
    // MARK: Instance Properties
    private let pokemon: Pokemon
    
    // MARK: View Properties
    var body: some View {
        VStack(spacing: 16.0) {
            ForEach(PokemonStat.allCases, id: \.self) {
                PokemonStatView(pokemon: pokemon, stat: $0)
            }
        }
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
