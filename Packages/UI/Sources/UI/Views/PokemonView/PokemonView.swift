//
//  PokemonView.swift
//
//  Created by Rob on 11/12/2023.
//

import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Pokemon View
public struct PokemonView: View {
    // MARK: Static Properties
    private enum Constants {
        #if os(iOS) || os(tvOS)
        fileprivate static let sheetHeight = UIScreen.main.bounds.height * 0.75
        #elseif os(macOS)
        fileprivate static let sheetHeight = (NSScreen.main?.frame.size.height ?? .zero) / 2.0
        #endif
    }
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    public let names: LocalizedContentDictionary
    public let pokemon: Pokemon
    
    // MARK: View Properties
    public var body: some View {
        ScrollView {
            VStack(spacing: 8.0) {
                PokemonHeaderView(
                    names: names,
                    pokemon: pokemon
                ).scrollable()
                PokemonViewSpacer()
                PokemonGeneralStatContainerView(
                    pokemon: pokemon
                ).scrollable()
                PokemonViewSpacer()
                PokemonStatContainerView(
                    pokemon: pokemon
                ).scrollable()
                PokemonViewSpacer()
                PokemonTextEntriesView(
                    pokemon: pokemon
                ).scrollable()
                PokemonViewSpacer()
                PokemonEvolutionChainView(
                    evolutionChain: pokemon.evolutionChain
                ).scrollable()
                PokemonViewSpacer()
                PokemonFooterView(
                    pokemon: pokemon
                ).scrollable()
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
    
    // MARK: Init Methods
    public init(
        names: LocalizedContentDictionary,
        pokemon: Pokemon
    ) {
        self.names = names
        self.pokemon = pokemon
    }
}

struct PokemonViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                Color.gray
                    .ignoresSafeArea()
                    .sheet(isPresented: .constant(true)) {
                        PokemonView(
                            names: pikachuLocalizedNames,
                            pokemon: pikachuPokemon
                        )
                        .preview(in: platform, displayMode: .light)
                    }
                Color.gray
                    .ignoresSafeArea()
                    .sheet(isPresented: .constant(true)) {
                        PokemonView(
                            names: pikachuLocalizedNames,
                            pokemon: pikachuPokemon
                        )
                        .preview(in: platform, displayMode: .dark)
                    }
            }
        }
    }
}
