//
//  PokedexListRowView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Defaults
import Kingfisher
import Mock
import Model
import Persistence
import UI
import SwiftData
import SwiftUI

// MARK: - Pokemon List Row View
struct PokedexListRowView: View {
    // MARK: Environment Properties
    @Environment(Defaults.self) private var defaults
    @Environment(\.modelContext) private var modelContext
    
    // MARK: Query Properties
    @Query private var content: [PersistenceContent]

    // MARK: Type Properties
    enum Constants {
        fileprivate static let emptyPokemonName = "--"
        fileprivate static let numberPrefix = "#"
        fileprivate static let spacing = 8.0
    }
    
    // MARK: State Properties
    @State private var viewModel: PokemonListRowViewModel
    
    // MARK: View Properties
    var body: some View {
        Button {
            viewModel.showPokemon(
                content: content,
                from: modelContext
            )
        } label: {
            HStack(spacing: 0.0) {
                ClippedImageView(
                    url: URLBuilder.shared.url(
                        for: .pokedexListImage,
                        pokemonId: viewModel.rowContent.key
                    )
                )
                .frame(height: 40.0)
                Text(viewModel.rowContent.value[defaults.language] ?? Constants.emptyPokemonName)
                    .font(.body)
                    .fontWeight(.light)
                Spacer()
            }
        }
        .frame(height: 50.0)
        .sheet(
            item: $viewModel.currentSheetDestination,
            onDismiss: { viewModel.currentSheetDestination = nil }
        ) { sheetDestination in
            switch sheetDestination {
            case .pokemonView(let nameInformation, let pokemon):
                PokemonView(
                    names: nameInformation,
                    pokemon: pokemon
                )
            }
        }
    }
    
    // MARK: Init Methods
    init(rowContent: PokedexListView.Content) {
        _viewModel = State(
            initialValue: PokemonListRowViewModel(
                rowContent: rowContent
            )
        )
    }
}

#Preview {
    PokedexListRowView(
        rowContent: (25, pikachuLocalizedNames)
    )
    .environment(Defaults.shared)
}
