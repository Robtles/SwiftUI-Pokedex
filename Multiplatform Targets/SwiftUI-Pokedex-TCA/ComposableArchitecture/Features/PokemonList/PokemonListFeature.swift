//
//  PokemonListFeature.swift
//  SwiftUI-Pokedex-TCA
//
//  Created by Rob on 15/01/2024.
//

import API
import ComposableArchitecture
import Model

// MARK: - Pokémon List Reducer
@Reducer
struct PokemonListFeature {
    // MARK: Reducer
    struct State: Equatable {
        /// The Pokémon alert destination
        @PresentationState var destination: Destination.State?
        /// Error handler
        var error = ErrorFeature.State()
        /// If there is a Pokémon being loaded
        var loading: Bool = false
        /// The Pokémon names list
        var pokemonNames: LocalizedIndexedContentDictionary = [:]
    }
    
    enum Action {
        case destination(PresentationAction<Destination.Action>)
        case displayPokemon(id: Int)
        case error(ErrorFeature.Action)
        case pokemonLoaded(Pokemon)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.error, action: \.error) {
            ErrorFeature()
        }
        Reduce { state, action in
            switch action {
            case .destination, .error:
                return .none
            case .displayPokemon(let id):
                state.loading = true
                return .run { send in
                    do {
                        let pokemon = try await API.shared.getPokemonInformation(id: id)
                        await send(.pokemonLoaded(pokemon))
                    } catch {
                        await send(.error(.displayErrorMessage(error.localizedDescription)))
                    }
                }
            case .pokemonLoaded(let pokemon):
                state.loading = false
                state.destination = .pokemon(
                    PokemonViewFeature.State(
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

extension PokemonListFeature {
    @Reducer
    struct Destination {
        enum State: Equatable {
            case pokemon(PokemonViewFeature.State)
        }
        
        enum Action {
            case pokemon(PokemonViewFeature.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.pokemon, action: \.pokemon) {
                PokemonViewFeature()
            }
        }
    }
}
