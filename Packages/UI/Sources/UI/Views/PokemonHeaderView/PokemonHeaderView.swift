//
//  PokemonHeaderView.swift
//
//  Created by Rob on 16/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokemon Header View
struct PokemonHeaderView: View {
    // MARK: Instance Properties
    let names: LocalizedContentDictionary
    let pokemon: Pokemon
    
    // MARK: View Properties
    var body: some View {
        buildPokemonHeaderView()
    }
    
    // MARK: View Methods
    @ViewBuilder private func buildPokemonHeaderView() -> some View {
        switch Platform.current {
        case .iOS, .iPadOS:
            PokemonHeaderView_iOS(
                names: names,
                pokemon: pokemon
            )
        default:
            EmptyView()
        }
    }
}

struct PokemonHeaderViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonHeaderView(
                    names: pikachuLocalizedNames,
                    pokemon: pikachuPokemon
                )
                .preview(in: platform, displayMode: .light)
                PokemonHeaderView(
                    names: pikachuLocalizedNames,
                    pokemon: pikachuPokemon
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
    }
}
