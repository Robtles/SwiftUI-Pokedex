//
//  ImageView.swift
//
//  Created by Rob on 27/11/2023.
//

import Kingfisher
import SwiftUI

// MARK: - Image View
/// Image view with content loaded from internet
struct ImageView: View {
    // MARK: Image Properties
    /// The URL to download and display the image from
    let url: URL
    
    // MARK: View Properties
    var body: some View {
        KFImage(url)
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    ImageView(
        url: URLBuilder.shared.url(
            for: .pokedexListImage,
            pokemonId: 25
        )
    )
    .frame(height: 70.0)
}
