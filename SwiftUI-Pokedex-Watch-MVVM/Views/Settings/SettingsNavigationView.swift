//
//  SettingsNavigationView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Defaults
import SwiftUI

// MARK: Type Properties
enum SettingsNavigationPath {
    case language
    case sortingOrder
}

// MARK: - Settings Navigation View
struct SettingsNavigationView: View {
    // MARK: Environment Properties
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    @State private var viewModel = SettingsNavigationViewModel()
    
    // MARK: View Properties
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            SettingsView(path: $viewModel.path)
                .navigationDestination(for: SettingsNavigationPath.self) { path in
                    switch path {
                    case .language:
                        SettingsSelectionView(
                            path: $viewModel.path,
                            initialValue: defaults.language
                        )
                    case .sortingOrder:
                        SettingsSelectionView(
                            path: $viewModel.path,
                            initialValue: defaults.sortingOrder
                        )
                    }
                }
        }
    }
}

#Preview {
    SettingsNavigationView()
}
