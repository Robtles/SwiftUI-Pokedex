//
//  Repository.swift
//  SwiftUI-Pokedex-CA
//
//  Created by Rob on 11/01/2024.
//

import Foundation

// MARK: Repository Conformance
protocol Repository: AnyObject, FetchPokemonListUseCase & FetchPokemonUseCase {}
