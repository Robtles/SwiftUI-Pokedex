//
//  PokemonGeneralStatContainerView.swift
//
//  Created by Rob on 21/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokemon General Stat Container View
struct PokemonGeneralStatContainerView: View {
    // MARK: Instance Properties
    private let pokemon: Pokemon
    
    // MARK: View Properties
    var body: some View {
        VStack(spacing: 16.0) {
            Spacer()
            HStack(spacing: 8.0) {
                Spacer()
                PokemonGeneralStatView(
                    pokemon: pokemon,
                    stat: .height
                )
                Spacer()
                PokemonGeneralStatView(
                    pokemon: pokemon,
                    stat: .weight
                )
                Spacer()
            }
            HStack(spacing: 8.0) {
                Spacer()
                PokemonGeneralStatView(
                    pokemon: pokemon,
                    stat: .baseHappiness
                )
                Spacer()
                PokemonGeneralStatView(
                    pokemon: pokemon,
                    stat: .captureRate
                )
                Spacer()
            }
            Spacer()
        }
    }
        
    // MARK: Init Methods
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}

struct PokemonGeneralStatContainerViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonGeneralStatContainerView(
                    pokemon: pikachuPokemon
                )
                .preview(in: platform, displayMode: .light)
                PokemonGeneralStatContainerView(
                    pokemon: pikachuPokemon
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
    }
}
