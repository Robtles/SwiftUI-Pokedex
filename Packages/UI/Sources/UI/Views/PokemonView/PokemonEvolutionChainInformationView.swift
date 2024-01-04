//
//  PokemonEvolutionChainInformationView.swift
//
//  Created by Rob on 02/01/2024.
//

#if !os(watchOS)
import Mock
import Model
import SwiftUI

// MARK: - Pokémon Evolution Chain Information View
struct PokemonEvolutionChainInformationView: View {
    // MARK: Instance Properties
    let evolutionDetails: EvolutionDetails?
    
    // MARK: View Properties
    var body: some View {
        VStack(spacing: 8.0) {
            Spacer()
            if let evolutionDetails {
                if let heldItem = evolutionDetails.heldItem {
                    PokemonEvolutionChainShrinkedImageLineView(
                        imageId: heldItem.id,
                        Strings.EvolutionDetails.whenHolding,
                        Strings.EvolutionDetails.item(for: heldItem.id)
                    )
                }
                if let timeOfDay = evolutionDetails.timeOfDay {
                    PokemonEvolutionChainShrinkedLineView(timeOfDay.texts)
                }
                if let trigger = evolutionDetails.trigger {
                    switch trigger {
                    case .item(let itemId):
                        PokemonEvolutionChainShrinkedImageLineView(
                            imageId: itemId.id,
                            Strings.EvolutionDetails.withItem,
                            Strings.EvolutionDetails.item(for: itemId.id)
                        )
                    case .levelUp(let levelUpTrigger):
                        switch levelUpTrigger {
                        case .minAffection(let value):
                            PokemonEvolutionChainShrinkedLineView(
                                "🥰 ",
                                Strings.EvolutionDetails.levelUp(.affection, with: value)
                            )
                        case .minBeauty(let value):
                            PokemonEvolutionChainShrinkedLineView(
                                "💇 ",
                                Strings.EvolutionDetails.levelUp(.beauty, with: value)
                            )
                        case .minHappiness(let value):
                            PokemonEvolutionChainShrinkedLineView(
                                "😁 ",
                                Strings.EvolutionDetails.levelUp(.happiness, with: value)
                            )
                        case .minLevel(let value):
                            PokemonEvolutionChainShrinkedLineView(
                                "↗️ ",
                                Strings.EvolutionDetails.levelUp(.levelup, with: value)
                            )
                        }
                    case .shed:
                        PokemonEvolutionChainShrinkedLineView(
                            "🔄 ",
                            Strings.EvolutionDetails.shed
                        )
                    case .trade:
                        PokemonEvolutionChainShrinkedLineView(
                            "🤝 ",
                            Strings.EvolutionDetails.trade
                        )
                    }
                }
            }
            Spacer()
        }
        .frame(height: 48.0)
    }
}

struct PokemonEvolutionChainInformationViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonEvolutionChainInformationView(
                    evolutionDetails: eeveeEvolutionChain.chain.evolvingTo.first?.details
                )
                .preview(in: platform, displayMode: .light)
                PokemonEvolutionChainInformationView(
                    evolutionDetails: eeveeEvolutionChain.chain.evolvingTo.first?.details
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
#endif
