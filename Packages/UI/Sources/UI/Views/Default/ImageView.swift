//
//  ImageView.swift
//
//  Created by Rob on 27/11/2023.
//

import Kingfisher
import SwiftUI

// MARK: - Image View
/// Image view with content loaded from internet
public struct ImageView: View {
    // MARK: Image Properties
    /// The URL to download and display the image from
    let url: URL
    
    // MARK: View Properties
    public var body: some View {
        KFImage(url)
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
    
    // MARK: Init Methods
    public init(url: URL) {
        self.url = url
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
