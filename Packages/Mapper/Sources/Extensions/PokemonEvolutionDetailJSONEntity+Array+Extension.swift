//
//  PokemonEvolutionDetailJSONEntity+Array+Extension.swift
//
//  Created by Rob on 24/11/2023.
//

import Foundation
import Model

extension Array where Element == PokemonEvolutionDetailJSONEntity {
    /// Prevents the mapper from using empty evolution details 
    /// (i.e. those which are not used in this example, like evolution by location)
    var firstValid: PokemonEvolutionDetailJSONEntity? {
        return first {
            return switch $0.trigger.name {
            case TriggerConstants.shed, TriggerConstants.trade: true
            case TriggerConstants.useItem:
                $0.item != nil                
            case TriggerConstants.levelUp:
                $0.heldItem != nil ||
                $0.minAffection != nil ||
                $0.minBeauty != nil ||
                $0.minHappiness != nil ||
                $0.minLevel != nil ||
                [TimeOfDay.day, .night]
                    .map { $0.rawValue }
                    .contains($0.timeOfDay)
            default: false
            }
        }
    }
}
