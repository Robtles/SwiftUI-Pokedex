//
//  PokedexNavigationView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
import Mock
import Model
import Navigation
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
    private let pokemons: [Int: LocalizedContentDictionary]
    
    // MARK: View Properties
    var body: some View {
        @Bindable var navigation = Navigation.shared
        NavigationStack(path: $navigation.path) {
            PokemonListView(pokemons: pokemons)
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
                // TODO: Localize texts & add Language setting
                .navigationTitle("Pokédex")
                .toolbar {
                    Button("Settings", systemImage: "gearshape") {
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
    init(with pokemons: [Int : LocalizedContentDictionary]) {
        self.pokemons = pokemons
    }
    
    // MARK: Navigation Methods
    private func goToSettings() {
        Navigation.shared.go(to: .settings)
    }
}

struct PokedexNavigationViewPreview: PreviewProvider {
    @State private static var appModel = PokedexAppModel()
    
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
