//
//  SettingsSelectionView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 06/12/2023.
//

#if os(tvOS)
import Defaults
import SwiftUI
import UI

// MARK: - Settings Selection View
/// The settings selection view (specific to tvOS)
struct SettingsSelectionView: View {
    // MARK: Environment Properties
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    /// The currently selected value
    var defaultsType: any DefaultsEnum.Type
    
    // MARK: View Properties
    var body: some View {
        Text(defaultsType.title)
            .foregroundStyle(
                Colors.primaryText.from(
                    defaults,
                    colorScheme: colorScheme
                )
            )
            .background(
                Colors.primaryBackground.from(
                    defaults,
                    colorScheme: colorScheme
                )
            )
    }
}

struct SettingsSelectionViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                NavigationStack {
                    SettingsSelectionView(defaultsType: DisplayMode.self)
                        .preview(in: platform, displayMode: .light)
                }
                NavigationStack {
                    SettingsSelectionView(defaultsType: DisplayMode.self)
                        .preview(in: platform, displayMode: .dark)
                }
            }
        }
    }
}
#endif
