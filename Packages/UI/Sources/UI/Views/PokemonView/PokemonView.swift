//
//  PokemonView.swift
//
//  Created by Rob on 11/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokemon View
public struct PokemonView: View {
    // MARK: Environment Properties
    public let names: LocalizedContentDictionary
    public let pokemon: Pokemon?
    
    // MARK: View Properties
    public var body: some View {
        buildPokemonView()
    }
    
    // MARK: Init Methods
    public init(
        names: LocalizedContentDictionary,
        pokemon: Pokemon?
    ) {
        self.names = names
        self.pokemon = pokemon
    }
    
    // MARK: View Methods
    @ViewBuilder private func buildPokemonView() -> some View {
        if let pokemon {
            switch Platform.current {
            case .iOS, .iPadOS:
                PokemonView_iOS(
                    names: names,
                    pokemon: pokemon
                )
            default:
                EmptyView()
            }
        } else {
            PokemonMissingView()
                .ignoresSafeArea()
        }
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
