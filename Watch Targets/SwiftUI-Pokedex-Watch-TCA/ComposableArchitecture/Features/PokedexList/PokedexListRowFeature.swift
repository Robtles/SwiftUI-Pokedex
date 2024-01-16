//
//  PokedexListRowFeature.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 16/01/2024.
//

import API
import ComposableArchitecture
import Model

// MARK: - Pokédex List Row Reducer
@Reducer
struct PokedexListRowFeature {
    // MARK: Reducer
    struct State: Equatable {
        // MARK: Properties
        /// The Pokémon alert destination
        @PresentationState var destination: Destination.State?
        /// If there is a Pokémon being loaded
        var loading: Bool = false
        /// The Pokémon names list
        var pokemonNames: LocalizedIndexedContentDictionary = [:]
        /// The list row content
        var rowContent: PokemonListViewContent
        
        // MARK: Equatable
        static func == (lhs: PokedexListRowFeature.State, rhs: PokedexListRowFeature.State) -> Bool {
            return lhs.rowContent.key == rhs.rowContent.key
        }
    }
    
    enum Action {
        case destination(PresentationAction<Destination.Action>)
        case displayPokemon(id: Int)
        case pokemonLoaded(Pokemon)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .destination:
                return .none
            case .displayPokemon(let id):
                state.loading = true
                return .run { send in
                    do {
                        let pokemon = try await API.shared.getPokemonInformation(id: id)
                        await send(.pokemonLoaded(pokemon))
                    } catch {}
                }
            case .pokemonLoaded(let pokemon):
                state.loading = false
                state.destination = .pokemon(
                    PokemonFeature.State(
                        names: state.pokemonNames[pokemon.id.id] ?? [:],
                        pokemon: pokemon
                    )
                )
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
    }
}

extension PokedexListRowFeature {
    @Reducer
    struct Destination {
        enum State: Equatable {
            case pokemon(PokemonFeature.State)
        }
        
        enum Action {
            case pokemon(PokemonFeature.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.pokemon, action: \.pokemon) {
                PokemonFeature()
            }
        }
    }
}
