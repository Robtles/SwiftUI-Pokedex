//
//  PokedexListRowView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Defaults
import Kingfisher
import Mock
import SharedUI
import SwiftUI

// MARK: - Pokemon List Row View
struct PokedexListRowView: View {
    // MARK: Environment Properties
    @Environment(Defaults.self) private var defaults
    
    @State private var isSheetVisible: Bool = false
    
    // MARK: Type Properties
    enum Constants {
        fileprivate static let emptyPokemonName = "--"
        fileprivate static let numberPrefix = "#"
        fileprivate static let spacing = 8.0
    }
    
    // MARK: Instance Properties
    let rowContent: PokemonListViewContent
    
    // MARK: View Properties
    var body: some View {
        Button {
            isSheetVisible = true
        } label: {
            HStack(spacing: Constants.spacing) {
                ClippedImageView(
                    url: URLBuilder.shared.url(
                        for: .pokedexListImage,
                        pokemonId: rowContent.key
                    )
                )
                .frame(height: 40.0)
                Text(rowContent.value[defaults.language] ?? Constants.emptyPokemonName)
                    .font(.headline)
                Spacer()
            }
        }
        .frame(height: 50.0)
        .sheet(isPresented: $isSheetVisible) {
            Color.red
        }
    }
}

#Preview {
    PokedexListRowView(
        rowContent: (25, pikachuLocalizedNames)
    )
    .environment(Defaults.shared)
}
