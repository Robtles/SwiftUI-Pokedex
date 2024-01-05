//
//  PokemonListViewModel.swift
//  SwiftUI-Pokedex-MVVM
//
//  Created by Rob on 05/01/2024.
//

import API
import Defaults
import Error
import Foundation
import Model
import Navigation
import SwiftUI

// MARK: - Pokédex List View Model
@Observable class PokemonListViewModel {
    // MARK: State Properties
    var focused: Int?
    var loading: Bool = false
    
    // MARK: Internal Properties
    /// The app model
    private var appModel: AppModel?
    private var defaults: Defaults?
    private var errorManager: ErrorManager?
    
    // MARK: Properties
    public let pokemons: LocalizedIndexedContentDictionary
    
    // MARK: Computed Properties
    var sortedPokemons: [PokemonListView.Content] {
        return pokemons
            .map { (key: $0.key, value: $0.value) }
            .sorted {
                guard let defaults else { return false }
                let lName = $0.value[defaults.language] ?? ""
                let rName = $1.value[defaults.language] ?? ""
                return switch defaults.sortingOrder {
                case .byIndex: $0.key < $1.key
                case .byName: lName < rName
                }
            }
    }
    
    // MARK: Init Methods
    init(pokemons: LocalizedIndexedContentDictionary) {
        self.pokemons = pokemons
    }
    
    // MARK: Methods
    func displayPokemon(id: Int) {
        Task {
            do {
                loading = true
                let pokemon = try await API.shared.getPokemonInformation(id: id)
                loading = false
                appModel?.pokemons[id] = pokemon
                Navigation.shared.showPokemon(
                    id: id,
                    nameInformation: pokemons[id] ?? [:]
                )
            } catch {
                errorManager?.display(error.localizedDescription)
            }
        }
    }
    
    func setupEnvironmentValues(
        appModel: AppModel,
        defaults: Defaults,
        errorManager: ErrorManager
    ) {
        self.appModel = appModel
        self.defaults = defaults
        self.errorManager = errorManager
    }
}
