//
//  PokemonStatView.swift
//
//  Created by Rob on 21/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokémon Stat View
struct PokemonStatView: View {
    // MARK: Instance Properties
    private let pokemon: Pokemon
    private let stat: PokemonStat
    
    // MARK: View Properties
    var body: some View {
        HStack(spacing: 16.0) {
            Text(stat.localizedKey, bundle: .module)
                .frame(width: 70.0)
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
                .frame(width: 40.0)
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

struct PokemonStatViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                VStack(spacing: 16.0) {
                    ForEach(PokemonStat.allCases, id: \.self) { stat in
                        PokemonStatView(
                            pokemon: pikachuPokemon,
                            stat: stat
                        )
                    }
                }
                .preview(in: platform, displayMode: .light)
                VStack(spacing: 16.0) {
                    ForEach(PokemonStat.allCases, id: \.self) { stat in
                        PokemonStatView(
                            pokemon: pikachuPokemon,
                            stat: stat
                        )
                    }
                }
                .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
