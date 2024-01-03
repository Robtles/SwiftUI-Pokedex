//
//  PokemonTextEntriesView.swift
//
//  Created by Rob on 22/12/2023.
//

import Defaults
import Mock
import Model
import SwiftUI

// MARK: - Pokémon Text Entries View
struct PokemonTextEntriesView: View {
    // MARK: Environment Properties
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    
    // MARK: Instance Properties
    private let pokemon: Pokemon
    
    // MARK: View Properties
    var body: some View {
        VStack(spacing: 16.0) {
            if textEntriesToDisplay.isEmpty {
                HStack {
                    Text(Strings.PokemonTextEntriesView.noTextEntry, bundle: .module)
                    Spacer()
                }
            } else {
                ForEach(textEntriesToDisplay.sorted(by: { $0.key < $1.key }), id: \.key) { textEntry in
                    VStack(spacing: 8.0) {
                        if let localizedStringKey = textEntry.key.localizedStringKey {
                            HStack {
                                Text(localizedStringKey, bundle: .module)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .underline()
                                Spacer()
                            }
                        }
                        HStack {
                            Text(textEntry.value.carriageReturnFixed)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                }
            }
        }
        .foregroundStyle(
            Colors.primaryText.from(defaults, colorScheme: colorScheme)
        )
        .padding()
    }
    
    private var textEntriesToDisplay: [VersionID: String] {
        return pokemon.textEntries.reduce(
            into: [VersionID: String]()
        ) {
            if let text = $1.value.first(
                where: { textEntry in textEntry.key == defaults.language }
            )?.value {
                $0[$1.key] = text
            }
        }
    }

    // MARK: Init Methods
    init(
        pokemon: Pokemon
    ) {
        self.pokemon = pokemon
    }
}

struct PokemonTextEntriesViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                PokemonTextEntriesView(pokemon: pikachuPokemon)
                    .preview(in: platform, displayMode: .light)
                PokemonTextEntriesView(pokemon: pikachuPokemon)
                    .preview(in: platform, displayMode: .dark)
            }
        }
        .padding()
    }
}
