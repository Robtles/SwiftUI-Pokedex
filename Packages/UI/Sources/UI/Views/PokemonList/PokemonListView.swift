//
//  PokemonListView.swift
//
//  Created by Rob on 27/11/2023.
//

import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Pokemon List View
/// The initial Pokémon list view
public struct PokemonListView: View {
    // MARK: Type Properties
    private typealias PokemonListViewContent = (key: Int, value: LocalizedContentDictionary)
    
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
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
    
    // MARK: Properties
    public let pokemons: [Int: LocalizedContentDictionary]
    
    // MARK: View Properties
    public var body: some View {
        List(sortedPokemons, id: \.key) {
            PokemonListRowView(
                id: $0.key,
                localizedNames: $0.value
            )
            .listRowInsets(EdgeInsets())
            #if !os(tvOS)
            .listRowSeparatorTint(
                Colors.secondaryBackground.from(defaults, colorScheme: colorScheme)
            )
            #endif
        }
        .background(
            Colors.primaryBackground.from(defaults, colorScheme: colorScheme)
        )
        .listStyle(PlainListStyle())
    }
    
    // MARK: Init Methods
    public init(pokemons: [Int : LocalizedContentDictionary]) {
        self.pokemons = pokemons
    }
}

struct PokemonListViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) {
                PokemonListView(pokemons: firstLocalizedPokemons)
                    .preview(in: $0, displayMode: .light)
                PokemonListView(pokemons: firstLocalizedPokemons)
                    .preview(in: $0, displayMode: .dark)
            }
        }
    }
}
