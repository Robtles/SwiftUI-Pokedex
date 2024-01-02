//
//  PokemonStat+Extension.swift
//
//  Created by Rob on 22/12/2023.
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
