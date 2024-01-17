//
//  PokedexListRowFeature.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 16/01/2024.
//

import API
import ComposableArchitecture
import Model
import Persistence
import SwiftData

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
        case displayPokemon(id: Int, modelContext: ModelContext, content: [PersistenceContent])
        case pokemonLoaded(Pokemon)
        case saveLocally(Pokemon, modelContext: ModelContext, content: [PersistenceContent])
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .destination:
                return .none
            case .displayPokemon(let id, let modelContext, let content):
                state.loading = true
                return .run { send in
                    do {
                        let pokemon = try await get(
                            pokemonWithId: id,
                            from: modelContext,
                            and: content,
                            send: send
                        )
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
            case .saveLocally(let pokemon, let modelContext, let content):
                if let content = content.first {
                    content.pokemons[pokemon.id.id] = pokemon
                    modelContext.insert(content)
                }
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
    }
    
    private func get(
        pokemonWithId id: Int,
        from modelContext: ModelContext,
        and content: [PersistenceContent],
        send: Send<PokedexListRowFeature.Action>
    ) async throws -> Pokemon {
        if let pokemon = content.first?.pokemons[id] {
            return pokemon
        } else {
            let pokemon = try await API.shared.getPokemonInformation(id: id)
            await send(
                .saveLocally(pokemon, modelContext: modelContext, content: content)
            )
            return pokemon
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
