//
//  PokemonEvolutionChainView.swift
//
//  Created by Rob on 22/12/2023.
//

#if !os(watchOS)
import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Pokémon Evolution Chain View
struct PokemonEvolutionChainView: View {
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    private let evolutionChain: EvolutionChain
    
    // MARK: View Properties
    var body: some View {
        PokemonRecursiveEvolutionChainView(
            evolutionChainLink: evolutionChain.chain
        )
        .padding(.horizontal)
        .foregroundStyle(
            Colors.primaryText.from(defaults, colorScheme: colorScheme)
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
#endif
