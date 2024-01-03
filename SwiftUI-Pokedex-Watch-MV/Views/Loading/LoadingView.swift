//
//  LoadingView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import SwiftUI

// MARK: - Loading View
struct LoadingView: View {
    // MARK: View Properties
    var body: some View {
        Image("animated_pokeball")
            .resizable()
            .ignoresSafeArea()
            .frame(
                width: 100.0,
                height: 100.0
            )
    }
}

#Preview {
    LoadingView()
}
