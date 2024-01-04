//
//  PokemonEvolutionChainShrinkedImageLineView.swift
//
//  Created by Rob on 02/01/2024.
//

#if !os(watchOS)
import SwiftUI

// MARK: - Pokémon Evolution Chain Shrinked Image Line View
struct PokemonEvolutionChainShrinkedImageLineView: View {
    // MARK: Type Properties
    enum ImageContent {
        case id(Int)
        case name(String)
        
        var name: String {
            return switch self {
            case .id(let imageId):
                "full_item_\(imageId)"
            case .name(let imageName):
                imageName
            }
        }
    }
    
    // MARK: Instance Properties
    let image: ImageContent
    let imageSize: CGSize
    let texts: [String]
    
    // MARK: View Properties
    var body: some View {
        HStack(spacing: 8.0) {
            Image(image.name, bundle: .module)
                .resizable()
                .frame(
                    width: imageSize.width,
                    height: imageSize.height
                )
            PokemonEvolutionChainShrinkedLineView(texts)
            Spacer()
        }
    }
    
    // MARK: Init Methods
    init(
        imageId: Int,
        imageSize: CGSize = .init(
            width: 20.0,
            height: 20.0
        ),
        _ texts: String...
    ) {
        self.image = .id(imageId)
        self.imageSize = imageSize
        self.texts = texts.reduce(into: [], { $0.append($1) })
    }
    
    init(
        imageName: String,
        imageSize: CGSize = .init(
            width: 20.0,
            height: 20.0
        ),
        _ texts: String...
    ) {
        self.image = .name(imageName)
        self.imageSize = imageSize
        self.texts = texts.reduce(into: [], { $0.append($1) })
    }
}

struct PokemonEvolutionChainShrinkedImageLineViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonEvolutionChainShrinkedImageLineView(
                    imageId: 81,
                    "Moon Stone"
                )
                .preview(in: platform, displayMode: .light)
                PokemonEvolutionChainShrinkedImageLineView(
                    imageId: 81,
                    "Moon Stone"
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
#endif
