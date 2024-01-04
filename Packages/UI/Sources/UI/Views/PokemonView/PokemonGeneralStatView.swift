//
//  PokemonGeneralStatView.swift
//
//  Created by Rob on 04/01/2024.
//

import Defaults
import Model
import SwiftUI

// MARK: - Pokémon General Stat View
public struct PokemonGeneralStatView: View {
    // MARK: Type Properties
    private enum Constants {
        fileprivate static let emptyString = "--"
        fileprivate static let separator = " "
    }
    
    public enum Stat {
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
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    private let pokemon: Pokemon
    private let stat: Stat
    
    // MARK: View Properties
    public var body: some View {
        #if os(watchOS)
        HStack {
            Text(stat.text, bundle: .module)
                .font(.callout)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Spacer()
            if let unitKey = stat.unitKey {
                (Text(statValue) + Text(Constants.separator) + Text(unitKey, bundle: .module))
                    .font(.callout)
            } else {
                Text(statValue)
                    .font(.callout)
            }
        }
        #else
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
            .foregroundStyle(
                Colors.primaryText.from(defaults, colorScheme: colorScheme)
            )
            Spacer()
        }
        #endif
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
    public init(pokemon: Pokemon, stat: Stat) {
        self.pokemon = pokemon
        self.stat = stat
    }
}
