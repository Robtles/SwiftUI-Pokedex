//
//  PokemonStat+Extension.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Model
import SwiftUI

// MARK: Pokémon Stat Extension
extension PokemonStat {
    // MARK: Properties
    var barColor: Color {
        return switch self {
        case .attack: .red
        case .defense: .green
        case .specialAttack: .purple
        case .specialDefense: .brown
        case .speed: .orange
        case .hp: .cyan
        }
    }
    
    var localizedKey: LocalizedStringKey {
        return LocalizedStringKey("pokemonstat." + rawValue)
    }
}
