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

// MARK: - Pokédex List View
struct PokedexListView: View {
    // MARK: Type Properties
    typealias Content = (key: Int, value: LocalizedContentDictionary)
    
    // MARK: Environment Properties
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    @State private var viewModel: PokedexListViewModel
    
    // MARK: View Properties
    var body: some View {
        List(viewModel.sortedPokemons, id: \.key) {
            PokedexListRowView(rowContent: $0)
        }
        .onAppear {
            viewModel.setup(defaults: defaults)
        }
    }
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        _viewModel = State(
            initialValue: PokedexListViewModel(pokemons: pokemons)
        )
    }
}

#Preview {
    PokedexListView(pokemons: firstLocalizedPokemons)
        .environment(Defaults.shared)
}
