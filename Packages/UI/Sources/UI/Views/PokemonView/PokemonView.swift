//
//  PokemonView.swift
//
//  Created by Rob on 11/12/2023.
//

import Model
import SwiftUI

// MARK: - Pokemon View
public struct PokemonView: View {
    // MARK: Environment Properties
    public let pokemon: Pokemon?
    
    // MARK: View Properties
    public var body: some View {
        build()
    }
    
    // MARK: Init Methods
    public init(pokemon: Pokemon?) {
        self.pokemon = pokemon
    }
    
    // MARK: View Methods
    @ViewBuilder private func build() -> some View {
        if let pokemon {
            Text("Capture rate: \(pokemon.captureRate)")
        } else {
            Color.red
        }
    }
}
