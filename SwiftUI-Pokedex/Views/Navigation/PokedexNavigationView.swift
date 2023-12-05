//
//  PokedexNavigationView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Mock
import Model
import Navigation
import SwiftUI
import UI

// MARK: - Pokédex Navigation View
/// The main app navigation view
struct PokedexNavigationView: View {
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
                    case .settings: SettingsView()
                    }
                }
                // TODO: Localize texts & add Language setting
                .navigationTitle("Pokédex")
                .toolbar {
                    Button("Settings", systemImage: "gearshape") {
                        goToSettings()
                    }
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
