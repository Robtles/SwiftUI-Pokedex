//
//  SettingsRowView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import ComposableArchitecture
import Defaults
import Mock
import Model
import SwiftUI
import UI

// MARK: - Settings Row View
/// Represents the view for one of the settings rows
struct SettingsRowView<T>: View where T: DefaultsEnum {
    // MARK: Environment Properties
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    /// The currently selected value
    @Binding var selectedValue: T
    
    #if os(tvOS)
    // MARK: Store Properties
    let store: StoreOf<PokedexNavigationFeature>
    #endif
    
    // MARK: View Properties
    var body: some View {
        #if os(tvOS)
        SettingsRowView_tvOS(
            selectedValue: $selectedValue, 
            store: store
        )
        #else
            SettingsRowView_Default(selectedValue: $selectedValue)
        #endif
    }
}

struct SettingsRowViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            #if os(tvOS)
            SettingsRowView(
                selectedValue: .constant(Language.english),
                store: Store(
                    initialState: PokedexNavigationFeature.State(
                        pokemonNames: firstLocalizedPokemons
                    )
                ) {
                    PokedexNavigationFeature()
                }
            )
            .preview(in: Platform.tvOS, displayMode: .light)
            .padding()
            SettingsRowView(
                selectedValue: .constant(Language.english),
                store: Store(
                    initialState: PokedexNavigationFeature.State(
                        pokemonNames: firstLocalizedPokemons
                    )
                ) {
                    PokedexNavigationFeature()
                }
            )
            .preview(in: Platform.tvOS, displayMode: .dark)
            .padding()
            #else
            ForEach([Platform.iOS, .iPadOS, .macOS], id: \.self) { platform in
                SettingsRowView(selectedValue: .constant(Language.english))
                    .preview(in: Platform.iOS, displayMode: .light)
                SettingsRowView(selectedValue: .constant(Language.english))
                    .preview(in: Platform.iOS, displayMode: .dark)
            }
            .padding()
            #endif
        }
    }
}
