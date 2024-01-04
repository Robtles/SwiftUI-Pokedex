//
//  PokemonType+Extension.swift
//
//  Created by Rob on 03/01/2024.
//

import Model
import SwiftUI

// MARK: - Pokémon Type Extension
public extension PokemonType {
    // MARK: Properties
    var backgroundColor: Color {
        return switch self {
        case .normal: Color(hex: "BCBCAC")
        case .fighting: Color(hex: "BC5442")
        case .flying: Color(hex: "669AFF")
        case .poison: Color(hex: "AB549A")
        case .ground: Color(hex: "DEBC54")
        case .rock: Color(hex: "BCAC66")
        case .bug: Color(hex: "ABBC1C")
        case .ghost: Color(hex: "6666BC")
        case .steel: Color(hex: "BCBCBC")
        case .fire: Color(hex: "FF421C")
        case .water: Color(hex: "2F9AFF")
        case .grass: Color(hex: "78CD54")
        case .electric: Color(hex: "FFCD30")
        case .psychic: Color(hex: "FF549A")
        case .ice: Color(hex: "78DEFF")
        case .dragon: Color(hex: "7866EF")
        case .dark: Color(hex: "785442")
        case .fairy: Color(hex: "FFACFF")
        }
    }
    
    var borderColor: Color {
        return switch self {
        case .normal: Color(hex: "96968C")
        case .fighting: Color(hex: "703227")
        case .flying: Color(hex: "325599")
        case .poison: Color(hex: "66345C")
        case .ground: Color(hex: "947D38")
        case .rock: Color(hex: "8C814F")
        case .bug: Color(hex: "6F7A14")
        case .ghost: Color(hex: "444480")
        case .steel: Color(hex: "878787")
        case .fire: Color(hex: "9C2A13")
        case .water: Color(hex: "1E69B0")
        case .grass: Color(hex: "4D8535")
        case .electric: Color(hex: "A38524")
        case .psychic: Color(hex: "9C305D")
        case .ice: Color(hex: "49879C")
        case .dragon: Color(hex: "5043A3")
        case .dark: Color(hex: "402C22")
        case .fairy: Color(hex: "B87DB8")
        }
    }
    
    var nameKey: String {
        return "pokemontype." + rawValue
    }
    
    var textColor: Color {
        return switch self {
        case .dark: .white
        default: .black
        }
    }
}
