//
//  SettingsRowView~tvOS.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 05/12/2023.
//

#if os(tvOS)
import Defaults
import Model
import Navigation
import SwiftUI
import UI


// MARK: - Settings (tvOS only) Row View
/// Represents the view for one of the settings rows on tvOS
struct SettingsRowView_tvOS<T>: View where T: DefaultsEnum {
    // MARK: Environment Properties
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    /// The currently focused value from the parent list
    @FocusState private var focused: T?
    /// The selected row value
    @Binding var selectedValue: T
    
    // MARK: View Properties
    var body: some View {
        HStack {
            VStack(spacing: 24.0) {
                HStack {
                    Text(T.title)
                        .font(.title3)
                        .foregroundStyle(
                            Colors.primaryText.from(defaults, colorScheme: colorScheme)
                        )
                    Spacer()
                }
                HStack {
                    Text(T.description)
                        .font(.caption.italic())
                        .foregroundStyle(
                            Colors.secondaryText.from(defaults, colorScheme: colorScheme)
                        )
                    Spacer()
                }
            }
            Spacer()
            DefaultsEnumPickerRowView(
                value: selectedValue,
                focused: $focused
            ) {
                Navigation.shared.go(
                    to: .settingsSelection(selectedValue)
                )
            }
        }
        .background(
            Colors.primaryBackground.from(
                defaults,
                colorScheme: colorScheme
            )
        )
    }
}

struct SettingsRowView_tvOSPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(selectedValue: .constant(Language.english))
                .preview(in: .tvOS, displayMode: .light)
            SettingsRowView(selectedValue: .constant(Language.english))
                .preview(in: .tvOS, displayMode: .dark)
        }
    }
}
#endif
