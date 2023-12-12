//
//  PokedexNavigationView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
import Error
import Mock
import Model
import Navigation
import SwiftUI
import UI

// MARK: - Pokédex Navigation View
/// The main app navigation view
struct PokedexNavigationView: View {
    // MARK: Environment Properties
    @Environment(AppModel.self) private var appModel
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    @Environment(ErrorManager.self) fileprivate var errorManager
    
    // MARK: Instance Properties
    /// The Pokémon list
    private let pokemons: LocalizedIndexedContentDictionary
    
    // MARK: View Properties
    var body: some View {
        @Bindable var navigation = Navigation.shared
        NavigationStack(path: $navigation.path) {
            PokemonListView(
                pokemons: pokemons
            )
            .sheet(
                item: $navigation.currentSheetDestination,
                onDismiss: {
                    navigation.currentSheetDestination = nil
                }
            ) { destination in
                switch destination {
                case .pokemonView(let id):
                    PokemonView(pokemon: appModel.pokemons[id])
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .settings:
                    SettingsView()
                #if os(tvOS)
                case .settingsSelection(let selectedDefaults):
                    switch selectedDefaults {
                    case let language as Language:
                        SettingsSelectionView(initialValue: language)
                    case let sortingOrder as SortingOrder:
                        SettingsSelectionView(initialValue: sortingOrder)
                    case let displayMode as DisplayMode:
                        SettingsSelectionView(initialValue: displayMode)
                    default:
                        fatalError("Oops: DefaultsEnum type not handled yet")
                    }
                #endif
                }
            }
            .navigationTitle(Strings.PokedexNavigationView.title.localized)
            .toolbar {
                Button(
                    Strings.PokedexNavigationView.toolbarButton.localized,
                    systemImage: SystemImage.gearshape
                ) {
                    goToSettings()
                }
                #if os(tvOS)
                .tint(
                    Colors.primaryText.from(defaults, colorScheme: colorScheme)
                )
                #endif
            }
            .tint(.white)
        }
        .tint(.white)
    }
    
    // MARK: Init Methods
    init(with pokemons: LocalizedIndexedContentDictionary) {
        self.pokemons = pokemons
    }
    
    // MARK: Navigation Methods
    private func goToSettings() {
        Navigation.shared.go(to: .settings)
    }
}

struct PokedexNavigationViewPreview: PreviewProvider {
    @State private static var appModel = AppModel()
    
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokedexNavigationView(with: firstLocalizedPokemons)
                    .preview(in: platform, displayMode: .light)
                PokedexNavigationView(with: firstLocalizedPokemons)
                    .preview(in: platform, displayMode: .dark)
            }
        }
        .environment(appModel)
        .environment(Navigation.shared)
    }
}
