//
//  SettingsRowView~default.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 05/12/2023.
//

#if !os(tvOS)
import Defaults
import Model
import SwiftUI
import UI

// MARK: - Settings (non tvOS) Row View
/// Represents the view for one of the settings rows on non tvOS platforms
struct SettingsRowView_Default<T>: View where T: DefaultsEnum {
    // MARK: Environment Properties
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    @Binding var selectedValue: T
    
    // MARK: View Properties
    var body: some View {
        VStack {
            HStack {
                Text(T.title)
                    .foregroundStyle(
                        Colors.primaryText.from(defaults, colorScheme: colorScheme)
                    )
                Spacer()
                Picker(selection: $selectedValue, label: EmptyView()) {
                    ForEach(T.sortedAll, id: \.self) {
                        Text($0.rowName)
                            .foregroundStyle(
                                Colors.primaryText.from(defaults, colorScheme: colorScheme)
                            )
                    }
                }
                .tint(
                    Colors.highlightedText.from(defaults, colorScheme: colorScheme)
                )
            }
            HStack {
                Text(T.description)
                    .font(.caption.italic())
                    .foregroundStyle(
                        Colors.secondaryText.from(defaults, colorScheme: colorScheme)
                    )
                    .multilineTextAlignment(.leading)
                Spacer()
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

struct SettingsRowView_DefaultPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach([Platform.iOS, .iPadOS, .macOS], id: \.self) { platform in
                SettingsRowView(selectedValue: .constant(Language.english))
                    .preview(in: Platform.iOS, displayMode: .light)
                SettingsRowView(selectedValue: .constant(Language.english))
                    .preview(in: Platform.iOS, displayMode: .dark)
            }
            .padding()
        }
    }
}
#endif
