//
//  PokemonListLoadingView.swift
//
//  Created by Rob on 02/01/2024.
//

import Model
import SwiftUI

// MARK: - Pokémon List Loading View
struct PokemonListLoadingView: View {
    // MARK: View Properties
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.white)
                #if os(iOS)
                .controlSize(.large)
                #endif
        }
        .ignoresSafeArea()
    }
}

struct PokemonListLoadingViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonListLoadingView()
                    .preview(in: platform, displayMode: .light)
                PokemonListLoadingView()
                    .preview(in: platform, displayMode: .dark)
            }
        }
    }
}
