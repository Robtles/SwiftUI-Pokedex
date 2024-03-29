//
//  PokedexListRowView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import API
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

    // MARK: State Properties
    @State private var currentSheetDestination: SheetDestination?
    
    // MARK: Type Properties
    enum Constants {
        fileprivate static let emptyPokemonName = "--"
        fileprivate static let numberPrefix = "#"
        fileprivate static let spacing = 8.0
    }
    
    // MARK: Instance Properties
    let repository: Repository
    let rowContent: PokemonListViewContent
    
    // MARK: View Properties
    var body: some View {
        Button {
            showPokemon(
                id: rowContent.key,
                nameInformation: rowContent.value
            )
        } label: {
            HStack(spacing: 0.0) {
                ClippedImageView(
                    url: URLBuilder.shared.url(
                        for: .pokedexListImage,
                        pokemonId: rowContent.key
                    )
                )
                .frame(height: 40.0)
                Text(rowContent.value[defaults.language] ?? Constants.emptyPokemonName)
                    .font(.body)
                    .fontWeight(.light)
                Spacer()
            }
        }
        .frame(height: 50.0)
        .sheet(
            item: $currentSheetDestination,
            onDismiss: { currentSheetDestination = nil }
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
    init(
        repository: Repository, 
        rowContent: PokemonListViewContent
    ) {
        self.repository = repository
        self.rowContent = rowContent
    }
    
    // MARK: Sheet Methods
    private func get(pokemonWithId id: Int) async throws -> Pokemon {
        if let pokemon = content.first?.pokemons[id] {
            return pokemon
        } else {
            let pokemon = try await repository.fetchPokemon(id: id)
            if let content = content.first {
                content.pokemons[pokemon.id.id] = pokemon
                modelContext.insert(content)
            }
            return pokemon
        }
    }
    
    public func showPokemon(
        id: Int,
        nameInformation: LocalizedContentDictionary
    ) {
        Task {
            do {
                let pokemon = try await get(pokemonWithId: id)
                currentSheetDestination = .pokemonView(
                    nameInformation: nameInformation,
                    pokemon: pokemon
                )
            } catch {}
        }
    }
}

#Preview {
    PokedexListRowView(
        repository: APIRepository.shared,
        rowContent: (25, pikachuLocalizedNames)
    )
    .environment(Defaults.shared)
}
