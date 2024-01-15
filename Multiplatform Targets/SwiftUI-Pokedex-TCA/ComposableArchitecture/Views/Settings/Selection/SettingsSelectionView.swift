//
//  SettingsSelectionView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 06/12/2023.
//

#if os(tvOS)
import ComposableArchitecture
import Defaults
import Model
import SwiftUI
import UI

// MARK: - Settings Selection View
/// The settings selection view (specific to tvOS)
struct SettingsSelectionView<T>: View where T: DefaultsEnum {
    // MARK: Environment Properties
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    /// The currently selected value
    @FocusState private var focused: T?
    /// The value selected in user defaults
    var initialValue: T
    
    // MARK: Store Properties
    let store: StoreOf<PokedexNavigationFeature>
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(spacing: 24.0) {
                    ForEach(T.self.sortedAll, id: \.self) { defaultsLine in
                        DefaultsEnumPickerRowView(
                            value: defaultsLine,
                            focused: $focused,
                            needsExpansion: true
                        ) {
                            select(defaultsLine)
                            viewStore.send(.pop)
                            //                        Navigation.shared.pop()
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle(T.self.title)
            .background(
                Colors.primaryBackground.from(
                    defaults,
                    colorScheme: colorScheme
                )
            )
            .onAppear {
                focused = initialValue
            }
        }
    }
    
    // MARK: View Methods
    /// Selects a value and updates the user defaults accordingly
    private func select(_ value: T) {
        switch value {
        case let language as Language:
            defaults.language = language
        case let sortingOrder as SortingOrder:
            defaults.sortingOrder = sortingOrder
        case let displayMode as DisplayMode:
            defaults.displayMode = displayMode
        default:
            return
        }
    }
}
#endif
