//
//  PokemonRecursiveEvolutionChainView.swift
//
//  Created by Rob on 02/01/2024.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokémon Recursive Evolution Chain View
struct PokemonRecursiveEvolutionChainView: View {
    // MARK: Properties
    let evolutionChainLink: EvolutionChainLink
    let marginLeft: CGFloat

    // MARK: View Properties
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            HStack {
                ClippedImageView(
                    url: URLBuilder.shared.url(
                        for: .pokemonImage,
                        pokemonId: evolutionChainLink.species.id
                    )
                )
                .frame(
                    width: 48.0,
                    height: 48.0
                )
                PokemonEvolutionChainInformationView(
                    evolutionDetails: evolutionChainLink.details
                )
                Spacer()
            }
            ForEach(evolutionChainLink.evolvingTo, id: \.species.id) { nextEvolution in
                PokemonRecursiveEvolutionChainView(evolutionChainLink: nextEvolution, marginLeft: marginLeft + 16.0)
            }
        }
        .padding(.leading, marginLeft)
    }
    
    // MARK: Init Methods
    init(
        evolutionChainLink: EvolutionChainLink,
        marginLeft: CGFloat = 0.0
    ) {
        self.evolutionChainLink = evolutionChainLink
        self.marginLeft = marginLeft
    }
}

struct PokemonRecursiveEvolutionChainViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonRecursiveEvolutionChainView(
                    evolutionChainLink: eeveeEvolutionChain.chain
                )
                .preview(in: platform, displayMode: .light)
                PokemonRecursiveEvolutionChainView(
                    evolutionChainLink: eeveeEvolutionChain.chain
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
