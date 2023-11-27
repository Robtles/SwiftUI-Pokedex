//
//  ClippedImageView.swift
//
//  Created by Rob on 27/11/2023.
//

import Kingfisher
import SwiftUI

/// Clips an image view
struct ClippedImageView: View {
    // MARK: Image Properties
    /// The URL to download and display the image from
    let url: URL
    
    // MARK: View Properties
    var body: some View {
        KFImage(url)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .clipped()
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
