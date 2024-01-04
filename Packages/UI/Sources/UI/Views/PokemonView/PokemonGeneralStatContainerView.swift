//
//  PokemonGeneralStatContainerView.swift
//
//  Created by Rob on 04/01/2024.
//

import Model
import SwiftUI

// MARK: - Pokemon General Stat Container View
public struct PokemonGeneralStatContainerView: View {
    // MARK: Type Properties
    private enum Constants {
        #if os(watchOS)
        fileprivate static let spacing = 4.0
        #else
        fileprivate static let spacing = 16.0
        #endif
    }
    
    // MARK: Instance Properties
    private let pokemon: Pokemon
    
    // MARK: View Properties
    public var body: some View {
        VStack(spacing: Constants.spacing) {
            #if os(watchOS)
            PokemonGeneralStatView(
                pokemon: pokemon,
                stat: .height
            )
            PokemonGeneralStatView(
                pokemon: pokemon,
                stat: .weight
            )
            PokemonGeneralStatView(
                pokemon: pokemon,
                stat: .baseHappiness
            )
            PokemonGeneralStatView(
                pokemon: pokemon,
                stat: .captureRate
            )
            #else
            Spacer()
            HStack(spacing: 8.0) {
                Spacer()
                PokemonGeneralStatView(
                    pokemon: pokemon,
                    stat: .height
                )
                Spacer()
                PokemonGeneralStatView(
                    pokemon: pokemon,
                    stat: .weight
                )
                Spacer()
            }
            HStack(spacing: 8.0) {
                Spacer()
                PokemonGeneralStatView(
                    pokemon: pokemon,
                    stat: .baseHappiness
                )
                Spacer()
                PokemonGeneralStatView(
                    pokemon: pokemon,
                    stat: .captureRate
                )
                Spacer()
            }
            Spacer()
            #endif
        }
        #if os(watchOS)
        .padding()
        #endif
    }
        
    // MARK: Init Methods
    public init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}
