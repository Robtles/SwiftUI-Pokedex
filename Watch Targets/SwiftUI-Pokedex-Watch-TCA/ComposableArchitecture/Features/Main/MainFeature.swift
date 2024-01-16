//
//  MainFeature.swift
//  SwiftUI-Pokedex-Watch-TCA
//
//  Created by Rob on 15/01/2024.
//

import API
import ComposableArchitecture
import Foundation
import Model
import WatchAPI

// MARK: - Main Reducer
@Reducer
struct MainFeature {
    // MARK: Reducer
    struct State: Equatable {
        /// If the view is in a loading state
        var loading: Bool = true
        /// The Pokémon with their full information
        var pokemons: [Int: Pokemon] = [:]
        /// The loaded Pokémon names list
        var pokemonNames: LocalizedIndexedContentDictionary = [:]
        /// The Pokémon games versions
        var versions: [Version] = []
    }
    
    enum Action {
        case dataFetched(DataContent)
        case fetchData
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .dataFetched(let dataContent):
                state.loading = false
                state.pokemonNames = dataContent.pokemons
                state.versions = dataContent.versions
                return .none
            case .fetchData:
                return .run { send in
                    do {
                        let dataContent = try await fetchData()
                        await send(.dataFetched(dataContent))
                    } catch {}
                }
            }
        }
    }
    
    // MARK: Internal Methods
    /// Loads the required data: game versions and Pokémon list
    private func fetchData() async throws -> DataContent {
        return try await withThrowingTaskGroup(of: DataContent.self) { _ in
            let pokemons = try await WatchAPI.shared.getAllPokemons()
            let versions = try await WatchAPI.shared.getAllVersions()
            return DataContent(
                pokemons: pokemons,
                versions: versions
            )
        }
    }
}

extension Pokemon: Equatable {
    public static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id.id == rhs.id.id
    }
}
