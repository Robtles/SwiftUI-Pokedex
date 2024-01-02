//
//  PokemonSheetView.swift
//
//  Created by Rob on 11/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokemon Sheet View
public struct PokemonSheetView: View {
    // MARK: Instance Properties
    public let names: LocalizedContentDictionary
    public let pokemon: Pokemon?
    
    // MARK: View Properties
    public var body: some View {
        if let pokemon {
            PokemonView(
                names: names,
                pokemon: pokemon
            )
        } else {
            PokemonMissingView()
                .ignoresSafeArea()
        }
    }
    
    // MARK: Init Methods
    public init(
        names: LocalizedContentDictionary,
        pokemon: Pokemon?
    ) {
        self.names = names
        self.pokemon = pokemon
    }
}

struct PokemonSheetViewPreview: PreviewProvider {
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
