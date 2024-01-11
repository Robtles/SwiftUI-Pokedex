//
//  PokedexListView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Defaults
import Mock
import Model
import SwiftUI

// MARK: Type Properties
typealias PokemonListViewContent = (key: Int, value: LocalizedContentDictionary)

// MARK: - Pokédex List View
struct PokedexListView: View {
    // MARK: Environment Properties
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    private let pokemons: LocalizedIndexedContentDictionary
    private let repository: Repository
    
    // MARK: Computed Properties
    private var sortedPokemons: [PokemonListViewContent] {
        return pokemons
            .map { (key: $0.key, value: $0.value) }
            .sorted {
                let lName = $0.value[defaults.language] ?? ""
                let rName = $1.value[defaults.language] ?? ""
                return switch defaults.sortingOrder {
                case .byIndex: $0.key < $1.key
                case .byName: lName < rName
                }
            }
    }
    
    // MARK: View Properties
    var body: some View {
        List(sortedPokemons, id: \.key) {
            PokedexListRowView(
                repository: repository,
                rowContent: $0
            )
        }
    }
    
    // MARK: Init Methods
    init(
        pokemons: LocalizedIndexedContentDictionary,
        repository: Repository
    ) {
        self.pokemons = pokemons
        self.repository = repository
    }
}

#Preview {
    PokedexListView(
        pokemons: firstLocalizedPokemons,
        repository: APIRepository.shared
    )
    .environment(Defaults.shared)
}
