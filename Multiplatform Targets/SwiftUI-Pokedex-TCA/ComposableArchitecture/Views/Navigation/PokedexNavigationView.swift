//
//  PokedexNavigationView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import ComposableArchitecture
import Defaults
import Model
import SwiftUI
import UI

// MARK: - Pokédex Navigation View
/// The main app navigation view
struct PokedexNavigationView: View {
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    /// The Pokémon list
    let store: StoreOf<PokedexNavigationFeature>
    
    // MARK: View Properties
    var body: some View {
        NavigationStackStore(
            store.scope(state: \.path, action: \.path)
        ) {
            WithViewStore(store, observe: { $0 }) { viewStore in
                PokemonListView(
                    pokemons: viewStore.pokemonNames
                )
                .navigationTitle(Strings.PokedexNavigationView.title)
                .toolbar {
                    NavigationLink(
                        state: PokedexNavigationFeature.Path.State.settings
                    ) {
                        Image(systemName: SystemImage.gearshape)
                        #if os(tvOS)
                        .tint(
                            Colors.primaryText.from(defaults, colorScheme: colorScheme)
                        )
                        #endif
                    }
                }
            }
        } destination: {
            switch $0 {
            case .settings:
            #if os(tvOS)
            SettingsView(store: store)
                .tint(.white)
            #else
            SettingsView()
                .tint(.white)
            #endif
            #if os(tvOS)
            case .settingsSelection(let selectedDefaults):
                switch selectedDefaults {
                case let language as Language:
                    SettingsSelectionView(initialValue: language, store: store)
                case let sortingOrder as SortingOrder:
                    SettingsSelectionView(initialValue: sortingOrder, store: store)
                case let displayMode as DisplayMode:
                    SettingsSelectionView(initialValue: displayMode, store: store)
                default:
                    fatalError("Oops: DefaultsEnum type not handled yet")
                }
            #endif
            }
        }
        .tint(.white)
    }
        
    // MARK: Init Methods
    init(store: StoreOf<PokedexNavigationFeature>) {
        self.store = store
    }
}
