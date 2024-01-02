//
//  PokemonFooterLineView.swift
//
//  Created by Rob on 16/12/2023.
//

import Mock
import Model
import SwiftUI

// MARK: - Pokémon Footer Line View
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
            Text(lineType.name, bundle: .module)
            Text(
                isValid ? Strings.Common.yes : Strings.Common.no,
                bundle: .module
            )
            .font(.headline)
            Spacer()
        }
    }
}

struct PokemonFooterLineViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonFooterLineView(
                    lineType: .baby, 
                    isValid: true
                )
                .preview(in: platform, displayMode: .light)
                .padding()
            }
        }
    }
}
