//
//  PokemonFooterLineView.swift
//
//  Created by Rob on 04/01/2024.
//

import SwiftUI

struct PokemonFooterLineView: View {
    // MARK: Type Properties
    enum LineType {
        // MARK: Cases
        case baby
        case legendary
        case mythical
        
        // MARK: Properties
        var emoji: String {
            return switch self {
            case .baby: "👶"
            case .legendary: "🐉"
            case .mythical: "🧚‍♂️"
            }
        }
        
        var name: LocalizedStringKey {
            return switch self {
            case .baby: Strings.PokemonFooterLineView.baby
            case .legendary: Strings.PokemonFooterLineView.legendary
            case .mythical: Strings.PokemonFooterLineView.mythical
            }
        }
    }
    
    // MARK: Instance Properties
    let lineType: LineType
    let isValid: Bool
    
    // MARK: View Properties
    var body: some View {
        HStack(alignment: .center) {
            Text(lineType.emoji)
                .font(.body)
            Text(lineType.name, bundle: .module)
                .font(.body)
            Text(
                isValid ? Strings.Common.yes : Strings.Common.no,
                bundle: .module
            )
            .font(.headline)
            Spacer()
        }
    }
}
