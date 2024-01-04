//
//  ClippedImageView.swift
//
//  Created by Rob on 27/11/2023.
//

import Kingfisher
import SwiftUI

// MARK: - Clipped Image View
/// Clips an image view
public struct ClippedImageView: View {
    // MARK: Image Properties
    /// The URL to download and display the image from
    let url: URL
    
    // MARK: View Properties
    public var body: some View {
        ImageView(url: url)
        .clipped()
    }
    
    // MARK: Init Methods
    public init(url: URL) {
        self.url = url
    }
}

#Preview {
    ClippedImageView(
        url: URLBuilder.shared.url(
            for: .pokedexListImage,
            pokemonId: 25
        )
    )
    .frame(height: 70.0)
}
