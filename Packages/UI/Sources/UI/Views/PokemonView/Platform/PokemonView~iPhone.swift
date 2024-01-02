//
//  PokemonView~iPhone.swift
//
//  Created by Rob on 14/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokemon View (iPhone)
struct PokemonView_iPhone: View {
    // MARK: Static Properties
    private enum Constants {
        fileprivate static let sheetHeight = UIScreen.main.bounds.height * 0.75
    }
    
    // MARK: Instance Properties
    let names: LocalizedContentDictionary
    let pokemon: Pokemon
    
    // MARK: View Properties
    var body: some View {
        ScrollView {
            VStack(spacing: 8.0) {
                PokemonHeaderView(
                    names: names,
                    pokemon: pokemon
                )
                PokemonViewSpacer()
                PokemonGeneralStatContainerView(
                    pokemon: pokemon
                )
                PokemonViewSpacer()
                PokemonStatContainerView(
                    pokemon: pokemon
                )
                PokemonViewSpacer()
                PokemonTextEntriesView(
                    pokemon: pokemon
                )
                PokemonViewSpacer()
                PokemonEvolutionChainView(
                    evolutionChain: pokemon.evolutionChain
                )
                PokemonViewSpacer()
                PokemonFooterView(
                    pokemon: pokemon
                )                
            }
        }
        .presentationDetents(
            [.height(Constants.sheetHeight)]
        )
        .scrollIndicators(.hidden)
    }
}

struct PokemonView_iPhonePreview: PreviewProvider {
    static var previews: some View {
        Group {
            Color.gray
                .ignoresSafeArea()
                .sheet(isPresented: .constant(true)) {
                    PokemonView_iPhone(
                        names: pikachuLocalizedNames,
                        pokemon: pikachuPokemon
                    )
                    .preview(in: .iOS, displayMode: .light)
                }
            Color.gray
                .ignoresSafeArea()
                .sheet(isPresented: .constant(true)) {
                    PokemonView_iPhone(
                        names: pikachuLocalizedNames,
                        pokemon: pikachuPokemon
                    )
                    .preview(in: .iOS, displayMode: .dark)
                }
        }
    }
}
