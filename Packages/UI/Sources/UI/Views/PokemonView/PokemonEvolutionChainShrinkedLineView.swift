//
//  PokemonEvolutionChainShrinkedLineView.swift
//
//  Created by Rob on 02/01/2024.
//

#if !os(watchOS)
import SwiftUI

// MARK: - Pokémon Evolution Chain Shrinked Line View
struct PokemonEvolutionChainShrinkedLineView: View {
    // MARK: Instance Properties
    let texts: [String]
    
    // MARK: View Properties
    var body: some View {
        HStack(spacing: 8.0) {
            texts.reduce(Text(""), { $0 + Text($1) })
                .lineLimit(1)
                .font(.body)
                .scaledToFill()
                .minimumScaleFactor(0.5)
            Spacer()
        }
    }

    // MARK: Init Methods
    init(_ texts: String...) {
        self.texts = texts.reduce(into: [], { $0.append($1) })
    }
    
    init(_ texts: [String]) {
        self.texts = texts
    }
}

struct PokemonEvolutionChainShrinkedLineViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonEvolutionChainShrinkedLineView("😄 ", "Happy")
                    .preview(in: platform, displayMode: .light)
                PokemonEvolutionChainShrinkedLineView("😄 ", "Happy")
                    .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
#endif
