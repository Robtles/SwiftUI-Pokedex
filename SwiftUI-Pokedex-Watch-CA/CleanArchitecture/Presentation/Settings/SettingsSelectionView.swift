//
//  SettingsSelectionView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Defaults
import Model
import SwiftUI

// MARK: - Settings Selection View
struct SettingsSelectionView<T>: View where T: DefaultsEnum {
    // MARK: Environment Properties
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    @Binding var path: [SettingsNavigationPath]
    
    // MARK: Instance Properties
    /// The value selected in user defaults
    var initialValue: T
    
    // MARK: View Properties
    var body: some View {
        ScrollView {
            VStack(spacing: 8.0) {
                Text(T.title)
                    .font(.title3)
                    .padding(.bottom, 16.0)
                ForEach(T.self.sortedAll, id: \.self) { defaultsLine in
                    Button {
                        select(defaultsLine)
                        path.removeLast()
                    } label: {
                        Text(defaultsLine.rowName)
                    }
                    .tint(initialValue == defaultsLine ? .red : .white)
                }
            }
        }
    }
    
    // MARK: View Methods
    private func select(_ value: T) {
        switch value {
        case let language as Language:
            defaults.language = language
        case let sortingOrder as SortingOrder:
            defaults.sortingOrder = sortingOrder
        default:
            return
        }
    }
}

#Preview {
    SettingsSelectionView(
        path: .constant([]),
        initialValue: Language.english
    )
    .environment(Defaults.shared)
}
