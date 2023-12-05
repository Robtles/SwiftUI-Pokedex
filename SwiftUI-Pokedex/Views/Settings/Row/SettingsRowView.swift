//
//  SettingsRowView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
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
    @Binding var selectedValue: T
    
    // MARK: View Properties
    var body: some View {
        #if os(tvOS)
            SettingsRowView_tvOS(selectedValue: $selectedValue)
        #else
            SettingsRowView_Default(selectedValue: $selectedValue)
        #endif
    }
}

struct SettingsRowViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                SettingsRowView(selectedValue: .constant(Language.english))
                    .preview(in: .iOS, displayMode: .light)
                SettingsRowView(selectedValue: .constant(Language.english))
                    .preview(in: .iOS, displayMode: .dark)
            }
            .padding()
        }
    }
}
