//
//  View+Extension.swift
//
//  Created by Rob on 02/01/2024.
//

import SwiftUI

extension View {
    @ViewBuilder func scrollable() -> some View {
        #if os(tvOS)
        Button(action: {}, label: {
            self
        })
        .buttonStyle(.automatic)
        #else
        self
        #endif
    }
}
