//
//  SettingsView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 30/11/2023.
//

import ComposableArchitecture
import Defaults
import SwiftUI
import UI

// MARK: - Settings View
/// The settings view
struct SettingsView: View {
    // MARK: Constants
    private enum Constants {
        fileprivate static var spacing: CGFloat {
            return switch Platform.current {
            case .tvOS: 48.0
            default: 24.0
            }
        }
    }
    
    // MARK: Environment Properties
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    #if os(tvOS)
    // MARK: Store Properties
    let store: StoreOf<PokedexNavigationFeature>
    #endif
    
    // MARK: View Properties
    var body: some View {
        @Bindable var defaults = defaults
        ScrollView {
            VStack(spacing: Constants.spacing) {
                #if os(tvOS)
                SettingsRowView(selectedValue: $defaults.language, store: store)
                SettingsRowView(selectedValue: $defaults.displayMode, store: store)
                SettingsRowView(selectedValue: $defaults.sortingOrder, store: store)
                #else
                SettingsRowView(selectedValue: $defaults.language)
                SettingsRowView(selectedValue: $defaults.displayMode)
                SettingsRowView(selectedValue: $defaults.sortingOrder)
                #endif
                Spacer()
            }
            .padding()
            .navigationTitle(Strings.Settings.title)
        }
        .background(
            Colors.primaryBackground.from(
                defaults,
                colorScheme: colorScheme
            )
        )
    }
}
