//
//  PokemonViewSpacer.swift
//
//  Created by Rob on 01/01/2024.
//

import Defaults
import Model
import SwiftUI

// MARK: - Pokemon View Spacer
public struct PokemonViewSpacer: View {
    // MARK: View Properties
    public var body: some View {
        Color.gray
            .opacity(0.3)
            .frame(height: 1.0)
            .padding(.horizontal, 24.0)
            .padding(.vertical, 4.0)        
    }
}

struct PokemonViewSpacerPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonViewSpacer()
            }
        }
    }
}
