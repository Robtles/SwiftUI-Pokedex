//
//  SettingsView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import SwiftUI

// MARK: - Settings View
struct SettingsView: View {
    // MARK: State Properties
    @Binding var path: [SettingsNavigationPath]
    
    // MARK: View Properties
    var body: some View {
        VStack {
            Text(Strings.SettingsView.title)
                .font(.title3)
            Spacer()
            Button {
                path.append(.language)
            } label: {
                Text(Strings.SettingsView.language)
            }
            Button {
                path.append(.sortingOrder)
            } label: {
                Text(Strings.SettingsView.sortingOrder)
            }
            Spacer()
        }
    }
}

#Preview {
    SettingsView(
        path: .constant([])
    )
}
