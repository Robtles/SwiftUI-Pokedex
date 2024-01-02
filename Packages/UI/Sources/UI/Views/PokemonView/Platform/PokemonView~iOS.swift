//
//  PokemonView~iOS.swift
//
//  Created by Rob on 14/12/2023.
//

import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Pokemon View (iPhone)
struct PokemonView_iOS: View {
    // MARK: Static Properties
    private enum Constants {
        fileprivate static let sheetHeight = UIScreen.main.bounds.height * 0.75
    }
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
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
        .background(
            Colors.popupBackground.from(defaults, colorScheme: colorScheme)
        )
        .presentationDetents(
            [.height(Constants.sheetHeight)]
        )
        .scrollIndicators(.hidden)
    }
}

struct PokemonView_iPhonePreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach([Platform.iOS, .iPadOS], id: \.self) { platform in
                Color.gray
                    .ignoresSafeArea()
                    .sheet(isPresented: .constant(true)) {
                        PokemonView_iOS(
                            names: pikachuLocalizedNames,
                            pokemon: pikachuPokemon
                        )
                        .preview(in: platform, displayMode: .light)
                    }
                Color.gray
                    .ignoresSafeArea()
                    .sheet(isPresented: .constant(true)) {
                        PokemonView_iOS(
                            names: pikachuLocalizedNames,
                            pokemon: pikachuPokemon
                        )
                        .preview(in: platform, displayMode: .dark)
                    }
            }
        }
    }
}
