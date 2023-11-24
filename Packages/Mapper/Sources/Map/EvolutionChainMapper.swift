//
//  EvolutionChainMapper.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation
import Model

struct EvolutionChainMapper {
    // MARK: Internal Evolution Chain Mapping
    static func getEvolutionChain(
        from evolutionChainRepresentation: PokemonEvolutionChainJSONEntity
    ) throws -> EvolutionChain {
        guard let chain = try getEvolutionChainLink(from: evolutionChainRepresentation.chain) else {
            throw MapperError.evolutionChainFailed
        }
        return EvolutionChain(
            id: ID<IdentifiableType.EvolutionChain>(evolutionChainRepresentation.id),
            chain: chain
        )
    }
    
    // MARK: Internal Private Evolution Chain Mapping
    private static func getEvolutionChainLink(
        from evolutionChainLinkEntity: PokemonEvolutionChainLinkJSONEntity
    ) throws -> EvolutionChainLink? {
        guard let speciesId = evolutionChainLinkEntity.species.id else {
            return nil
        }
        var evolutionDetails: EvolutionDetails?
        if let details = evolutionChainLinkEntity.evolutionDetails.firstValid,
           let trigger = getEvolutionChainLinkTrigger(from: details) {
            var heldItem: ID<IdentifiableType.Item>?
            if let heldItemId = evolutionChainLinkEntity.evolutionDetails.first?.heldItem?.id {
                heldItem = ID<IdentifiableType.Item>(heldItemId)
            }
            evolutionDetails = EvolutionDetails(
                heldItem: heldItem,
                timeOfDay: TimeOfDay(details.timeOfDay),
                trigger: trigger
            )
        }
        return EvolutionChainLink(
            details: evolutionDetails,
            evolvingTo: try evolutionChainLinkEntity.evolvesTo.compactMap { try getEvolutionChainLink(from: $0) },
            speciesId: ID<IdentifiableType.Pokemon>(speciesId)
        )
    }
    
    private static func getEvolutionChainLinkTrigger(
        from evolutionDetailsEntity: PokemonEvolutionDetailJSONEntity
    ) -> EvolutionTrigger? {
        if let itemId = evolutionDetailsEntity.item?.id {
            return .item(ID<IdentifiableType.Item>(itemId))
        }        
        return switch evolutionDetailsEntity.trigger.name {
        case TriggerConstants.levelUp, 
            TriggerConstants.useItem: getLevelUpTrigger(from: evolutionDetailsEntity)
        case TriggerConstants.shed: .shed
        case TriggerConstants.trade: .trade
        default: nil
        }
    }
    
    private static func getLevelUpTrigger(
        from evolutionDetailsEntity: PokemonEvolutionDetailJSONEntity
    ) -> EvolutionTrigger? {
        if let minAffection = evolutionDetailsEntity.minAffection {
            return .levelUp(.minAffection(minAffection))
        } else if let minBeauty = evolutionDetailsEntity.minBeauty {
            return .levelUp(.minBeauty(minBeauty))
        } else if let minHappiness = evolutionDetailsEntity.minHappiness {
            return .levelUp(.minHappiness(minHappiness))
        } else if let minLevel = evolutionDetailsEntity.minLevel {
            return .levelUp(.minLevel(minLevel))
        } else {
            return nil
        }
    }
}
