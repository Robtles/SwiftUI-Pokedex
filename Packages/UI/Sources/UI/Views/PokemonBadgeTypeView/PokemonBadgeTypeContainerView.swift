//
//  PokemonBadgeTypeContainerView.swift
//
//  Created by Rob on 16/12/2023.
//

import Model
import SwiftUI

// MARK: - Pokémon Badge Type Container View
struct PokemonBadgeTypeContainerView: View {
    // MARK: Instance Properties
    let pokemonTypes: [PokemonType]
    
    // MARK: View Properties
    var body: some View {
        HStack(spacing: 8.0) {
            ForEach(pokemonTypes, id: \.self) {
                PokemonBadgeTypeView(pokemonType: $0)
            }
            Spacer()
        }
    }
}

struct PokemonBadgeTypeContainerViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonBadgeTypeContainerView(
                    pokemonTypes: [.water, .ice]
                )
                .padding()
                .preview(in: platform, displayMode: .light)
                PokemonBadgeTypeContainerView(
                    pokemonTypes: [.fire, .rock]
                )
                .padding()
                .preview(in: platform, displayMode: .dark)
            }
        }
    }
}
