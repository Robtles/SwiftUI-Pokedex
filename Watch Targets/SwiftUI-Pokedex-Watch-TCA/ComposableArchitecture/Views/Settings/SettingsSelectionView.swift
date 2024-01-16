//
//  SettingsSelectionView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import ComposableArchitecture
import Defaults
import Model
import SwiftUI

// MARK: - Settings Selection View
struct SettingsSelectionView<T>: View where T: DefaultsEnum {
    // MARK: Environment Properties
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: State Properties
    let store: StoreOf<SettingsSelectionFeature<T>>
    
    // MARK: View Properties
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(spacing: 8.0) {
                    Text(T.title)
                        .font(.title3)
                        .padding(.bottom, 16.0)
                    ForEach(T.self.sortedAll, id: \.self) { defaultsLine in
                        Button {
                            viewStore.send(.select(defaultsLine, defaults: defaults))
                        } label: {
                            Text(defaultsLine.rowName)
                        }
                        .tint(viewStore.initialValue == defaultsLine ? .red : .white)
                    }
                }
            }
        }
    }
    
    // MARK: Init Methods
    init(
        initialValue: T
    ) {
        store = Store(
            initialState: SettingsSelectionFeature.State(
                initialValue: initialValue                
            )
        ) {
            SettingsSelectionFeature()
        }
    }
}

#Preview {
    SettingsSelectionView(
        initialValue: Language.english
    )
    .environment(Defaults.shared)
}
