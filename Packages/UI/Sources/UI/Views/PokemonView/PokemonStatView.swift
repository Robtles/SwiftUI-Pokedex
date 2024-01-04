//
//  PokemonStatView.swift
//
//  Created by Rob on 04/01/2024.
//

import Model
import SwiftUI

// MARK: - Pokémon Stat View
struct PokemonStatView: View {
    // MARK: Type Properties
    private enum Constants {
        fileprivate static let leftTextWidth = CGFloat.for(
            iOS: 70.0,
            iPadOS: 200.0,
            tvOS: 200.0,
            macOS: 70.0,
            watchOS: 50.0
        )
        fileprivate static let rightTextWidth = CGFloat.for(
            iOS: 40.0,
            iPadOS: 120.0,
            tvOS: 120.0,
            macOS: 40.0,
            watchOS: 30.0
        )
        fileprivate static let spacing = CGFloat.for(
            iOS: 16.0,
            iPadOS: 16.0,
            tvOS: 16.0,
            macOS: 16.0,
            watchOS: 4.0
        )
    }
    
    // MARK: Instance Properties
    private let pokemon: Pokemon
    private let stat: PokemonStat
    
    // MARK: View Properties
    var body: some View {
        HStack(spacing: Constants.spacing) {
            Text(stat.localizedKey, bundle: .module)
                .frame(width: Constants.leftTextWidth)
                #if os(watchOS)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                #endif
            ZStack {
                GeometryReader { reader in
                    RoundedRectangle(cornerRadius: 6.0)
                        .fill(Color.gray.opacity(0.2))
                    HStack(spacing: 0.0) {
                        RoundedRectangle(cornerRadius: 6.0)
                            .fill(stat.barColor)
                            .frame(width: reader.size.width * statRatio)
                        Spacer()
                    }
                }
            }
            .frame(height: 6.0)
            Text("\(pokemon.stats[stat] ?? 0)")
                .frame(width: Constants.rightTextWidth)
        }
    }
    
    private var statRatio: Double {
        guard let max = pokemon.stats.values.max() else { return 0.0 }
        return Double(pokemon.stats[stat] ?? 0) / Double(max)
    }
    
    // MARK: Init Methods
    init(
        pokemon: Pokemon,
        stat: PokemonStat
    ) {
        self.pokemon = pokemon
        self.stat = stat
    }
}
