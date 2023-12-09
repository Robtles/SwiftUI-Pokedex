//
//  SettingsView.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 30/11/2023.
//

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
    
    // MARK: View Properties
    var body: some View {
        @Bindable var defaults = defaults
        ScrollView {
            VStack(spacing: Constants.spacing) {
                SettingsRowView(selectedValue: $defaults.language)
                SettingsRowView(selectedValue: $defaults.displayMode)
                SettingsRowView(selectedValue: $defaults.sortingOrder)
                Spacer()
            }
            .padding()
            .navigationTitle(Strings.Settings.title.localized)
        }
        .background(
            Colors.primaryBackground.from(
                defaults,
                colorScheme: colorScheme
            )
        )
    }
}

struct SettingsViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                NavigationStack {
                    SettingsView()
                        .preview(in: platform, displayMode: .light)
                }
                NavigationStack {
                    SettingsView()
                        .preview(in: platform, displayMode: .dark)
                }
            }
        }
    }
}
