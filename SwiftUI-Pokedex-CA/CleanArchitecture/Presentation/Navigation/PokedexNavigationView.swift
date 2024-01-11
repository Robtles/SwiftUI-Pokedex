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
    private let pokemons: LocalizedIndexedContentDictionary
    private let repository: Repository
    
    // MARK: View Properties
    var body: some View {
        @Bindable var navigation = Navigation.shared
        NavigationStack(path: $navigation.path) {
            PokemonListView(
                pokemons: pokemons,
                repository: repository
            )
            .sheet(
                item: $navigation.currentSheetDestination,
                onDismiss: {
                    navigation.currentSheetDestination = nil
                }
            ) { destination in
                switch destination {
                case .pokemonView(let id, let nameInformation):
                    PokemonSheetView(
                        names: nameInformation,
                        pokemon: appModel.pokemons[id]
                    )
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
            .navigationTitle(Strings.PokedexNavigationView.title)
            .toolbar {
                Button(
                    "",
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
    init(
        with pokemons: LocalizedIndexedContentDictionary,
        repository: Repository
    ) {
        self.pokemons = pokemons
        self.repository = repository
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
                PokedexNavigationView(
                    with: firstLocalizedPokemons,
                    repository: APIRepository.shared // we could pass a mock repo here for test purposes
                )
                .preview(in: platform, displayMode: .light)
                PokedexNavigationView(
                    with: firstLocalizedPokemons,
                    repository: APIRepository.shared
                )
                .preview(in: platform, displayMode: .dark)
            }
        }
        .environment(appModel)
        .environment(Navigation.shared)
    }
}
