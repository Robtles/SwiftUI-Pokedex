//
//  MainViewModel.swift
//  SwiftUI-Pokedex-MVVM
//
//  Created by Rob on 05/01/2024.
//

import API
import Foundation
import Model
import SwiftUI
import WatchAPI

// MARK: - Main View Model
@Observable class MainViewModel {
    // MARK: Properties
    /// If the view is in a loading state
    var loading: Bool = true
    /// The loaded Pokémon list
    var pokemons: LocalizedIndexedContentDictionary = [:]
    
    // MARK: Internal Properties
    /// The app model
    private var appModel: AppModel?
    
    // MARK: Methods
    func loadData() async throws {
        let dataContent = try await withThrowingTaskGroup(of: DataContent.self) { _ in
            let pokemons = try await WatchAPI.shared.getAllPokemons()
            let versions = try await WatchAPI.shared.getAllVersions()
            return DataContent(
                pokemons: pokemons,
                versions: versions
            )
        }
        appModel?.versions = dataContent.versions
        pokemons = dataContent.pokemons
        loading = false
    }
    
    func setup(_ appModel: AppModel) {
        self.appModel = appModel
    }
}
