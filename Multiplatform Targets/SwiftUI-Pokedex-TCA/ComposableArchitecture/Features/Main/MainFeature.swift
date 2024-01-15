//
//  MainFeature.swift
//  SwiftUI-Pokedex-TCA
//
//  Created by Rob on 15/01/2024.
//

import API
import ComposableArchitecture
import Model

// MARK: - Main Feature Reducer
@Reducer
struct MainFeature {
    // MARK: Reducer
    struct State: Equatable {
        /// An optional error message
        var error = ErrorFeature.State()
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
        case error(ErrorFeature.Action)
        case fetchData
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.error, action: \.error) {
            ErrorFeature()
        }
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
                    } catch {
                        await send(.error(.displayErrorMessage(error.localizedDescription)))
                    }
                }
            default:
                return .none
            }
        }
    }
    
    // MARK: Internal Methods
    /// Loads the required data: game versions and Pokémon list
    private func fetchData() async throws -> DataContent {
        return try await withThrowingTaskGroup(of: DataContent.self) { _ in
            let pokemons = try await API.shared.getAllPokemons()
            let versions = try await API.shared.getAllVersions()
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
