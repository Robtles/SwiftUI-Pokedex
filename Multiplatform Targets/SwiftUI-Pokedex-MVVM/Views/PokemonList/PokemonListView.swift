//
//  PokemonListView.swift
//
//  Created by Rob on 27/11/2023.
//

import API
import Defaults
import Error
import Mock
import Model
import Navigation
import SwiftUI
import UI

// MARK: - Pokemon List View
/// The initial Pokémon list view
public struct PokemonListView: View {    
    // MARK: Type Properties
    typealias Content = (key: Int, value: LocalizedContentDictionary)
    
    // MARK: State Properties
    @State private var viewModel: PokemonListViewModel
    @FocusState private var focused: Int?
    
    // MARK: Environment Properties
    @Environment(AppModel.self) fileprivate var appModel
    @Environment(\.colorScheme) fileprivate var colorScheme
    @Environment(Defaults.self) private var defaults
    @Environment(ErrorManager.self) private var errorManager
    
    // MARK: View Properties
    public var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                List(viewModel.sortedPokemons, id: \.key) { pokemon in
                    internalRow(pokemon)
                        .focused($focused, equals: pokemon.key)
                        .listRowInsets(EdgeInsets())
                }
                .onChange(of: focused) {
                    viewModel.focused = $1
                }
                .onAppear {
                    focused = viewModel.focused
                    viewModel.setupEnvironmentValues(
                        appModel: appModel,
                        defaults: defaults,
                        errorManager: errorManager
                    )
                }
                .background(
                    Colors.primaryBackground.from(defaults, colorScheme: colorScheme)
                )
                .listStyle(PlainListStyle())
                #if os(tvOS)
                .onMoveCommand(perform: viewModel.handleMoveCommand(proxy: proxy))
                #endif
            }
            if viewModel.loading {
                PokemonListLoadingView()
            }
        }
    }
    
    // MARK: Init Methods
    public init(pokemons: LocalizedIndexedContentDictionary) {
        _viewModel = State(
            initialValue: PokemonListViewModel(pokemons: pokemons)
        )
    }
    
    // MARK: View Methods
    @ViewBuilder private func internalRow(
        _ pokemon: PokemonListView.Content
    ) -> some View {
        #if os(tvOS)
        Button {
            viewModel.displayPokemon(id: pokemon.key)
        } label: {
            PokemonListRowView(
                id: pokemon.key,
                localizedNames: pokemon.value
            )
        }
        #else
        PokemonListRowView(
            id: pokemon.key,
            localizedNames: pokemon.value
        )
        .onTapGesture {
            viewModel.displayPokemon(id: pokemon.key)
        }
        #if !os(watchOS)
        .listRowSeparatorTint(
            Colors.secondaryBackground.from(defaults, colorScheme: colorScheme)
        )
        #endif
        #if os(macOS)
        // ugly workaround for macOS to remove unnecessary horizontal padding around the list rows
        .padding(.horizontal, -8.0)
        #endif
        #endif
    }
}

struct PokemonListViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) {
                PokemonListView(pokemons: firstLocalizedPokemons)
                    .environment(AppModel())
                    .environment(ErrorManager.shared)
                    .preview(in: $0, displayMode: .light)
                PokemonListView(pokemons: firstLocalizedPokemons)
                    .environment(AppModel())
                    .environment(ErrorManager.shared)
                    .preview(in: $0, displayMode: .dark)
            }
        }
    }
}
