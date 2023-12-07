//
//  SettingsSelectionView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 06/12/2023.
//

#if os(tvOS)
import Defaults
import Model
import Navigation
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
    
    // MARK: View Properties
    var body: some View {
        ScrollView {
            VStack(spacing: 24.0) {
                ForEach(T.self.sortedAll, id: \.self) { defaultsLine in
                    DefaultsEnumPickerRowView(
                        value: defaultsLine,
                        focused: $focused,
                        needsExpansion: true
                    ) {
                        select(defaultsLine)
                        Navigation.shared.pop()
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
    
    // MARK: View Methods
    /// Selects a value and updates the user defaults accordingly
    private func select(_ value: T) {
        switch value {
        case let language as Language:
            Defaults.shared.language = language
        case let sortingOrder as SortingOrder:
            Defaults.shared.sortingOrder = sortingOrder
        case let displayMode as DisplayMode:
            Defaults.shared.displayMode = displayMode
        default:
            return
        }
    }
}

struct SettingsSelectionViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                SettingsSelectionView(initialValue: DisplayMode.light)
                    .preview(in: .tvOS, displayMode: .light)
            }
            NavigationStack {
                SettingsSelectionView(initialValue: DisplayMode.dark)
                    .preview(in: .tvOS, displayMode: .dark)
            }
        }
    }
}
#endif
