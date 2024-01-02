//
//  PokemonEvolutionChainView.swift
//
//  Created by Rob on 22/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokémon Evolution Chain View
struct PokemonEvolutionChainView: View {
    // MARK: Instance Properties
    private let evolutionChain: EvolutionChain
    
    // MARK: View Properties
    var body: some View {
        PokemonRecursiveEvolutionChainView(
            evolutionChainLink: evolutionChain.chain
        )
    }

    // MARK: Init Methods
    init(
        evolutionChain: EvolutionChain
    ) {
        self.evolutionChain = evolutionChain
    }
}

struct PokemonEvolutionChainViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonEvolutionChainView(
                    evolutionChain: eeveeEvolutionChain
                )
                .preview(in: platform, displayMode: .light)
                PokemonEvolutionChainView(
                    evolutionChain: eeveeEvolutionChain
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
