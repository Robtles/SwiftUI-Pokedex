//
//  PokemonGeneralStatView.swift
//
//  Created by Rob on 20/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokemon General Stat View
struct PokemonGeneralStatView: View {
    // MARK: Type Properties
    private enum Constants {
        fileprivate static let emptyString = "--"
        fileprivate static let separator = " "
    }
    
    enum Stat {
        // MARK: Cases
        case baseHappiness
        case captureRate
        case height
        case weight
        
        // MARK: Properties
        fileprivate var text: LocalizedStringKey {
            return switch self {
            case .baseHappiness: Strings.PokemonGeneralStatView.baseHappiness
            case .captureRate: Strings.PokemonGeneralStatView.captureRate
            case .height: Strings.PokemonGeneralStatView.height
            case .weight: Strings.PokemonGeneralStatView.weight
            }
        }
        
        fileprivate var unitKey: LocalizedStringKey? {
            return switch self {
            case .height: Strings.PokemonGeneralStatView.heightUnit
            case .weight: Strings.PokemonGeneralStatView.weightUnit
            default: nil
            }
        }
    }
    
    // MARK: Instance Properties
    private let pokemon: Pokemon
    private let stat: Stat
    
    // MARK: View Properties
    var body: some View {
        HStack(spacing: 0.0) {
            Spacer()
            VStack(spacing: 8.0) {
                Text(stat.text, bundle: .module)
                    .font(.callout)
                    .fontWeight(.bold)
                if let unitKey = stat.unitKey {
                    (Text(statValue) + Text(Constants.separator) + Text(unitKey, bundle: .module))
                        .font(.callout)
                } else {
                    Text(statValue)
                        .font(.callout)
                }
            }
            Spacer()
        }
    }
    
    private var statFormatter: NumberFormatter {
        let statFormatter = NumberFormatter()
        statFormatter.decimalSeparator = ","
        statFormatter.minimumFractionDigits = 0
        statFormatter.maximumFractionDigits = 1
        return statFormatter
    }
    
    // MARK: View Methods
    private var statValue: String {
        return switch stat {
        case .baseHappiness:
            "\(pokemon.baseHappiness)"
        case .captureRate:
            "\(pokemon.captureRate)"
        case .height:
            statFormatter.string(
                from: NSNumber(
                    value: Double(pokemon.height) / 10.0
                )
            ) ?? Constants.emptyString
        case .weight:
            statFormatter.string(
                from: NSNumber(
                    value: Double(pokemon.weight) / 10.0
                )
            ) ?? Constants.emptyString
        }
    }
        
    // MARK: Init Methods
    init(pokemon: Pokemon, stat: Stat) {
        self.pokemon = pokemon
        self.stat = stat
    }
}

struct PokemonGeneralStatViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonGeneralStatView(
                    pokemon: pikachuPokemon,
                    stat: .height
                )
                .preview(in: platform, displayMode: .light)
                PokemonGeneralStatView(
                    pokemon: pikachuPokemon,
                    stat: .height
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
    }
}
