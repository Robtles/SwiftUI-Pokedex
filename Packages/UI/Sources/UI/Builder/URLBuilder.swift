//
//  URLBuilder.swift
//
//  Created by Rob on 26/11/2023.
//

import Foundation

/// Builds URLs, mainly for image downloading purposes
struct URLBuilder {
    // MARK: Static Properties
    private enum Constants {
        fileprivate static let gifExtension = ".gif"
        fileprivate static let pngExtension = ".png"
        fileprivate static let urlAnimatedAppendix = "versions/generation-v/black-white/animated/"
        fileprivate static let urlPrefix = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    }
    
    // MARK: Internal Type
    enum URLType {
        case pokedexListImage
        case pokemonImage
    }
    
    // MARK: Singleton
    public static let shared = URLBuilder()
    
    // MARK: Init Methods
    private init() {}
    
    // MARK: Methods
    /// Builds the expected URL for the given Pokémon id, and sprite (Pokédex list or Pokémon view)
    /// - Parameters:
    ///   - urlType: The URL type expected (Pokédex list or Pokémon view)
    ///   - pokemonId: The Pokémon id
    /// - Returns: The corresponding URL
    func url(
        for urlType: URLType,
        pokemonId: Int
    ) -> URL {
        switch urlType {
        case .pokedexListImage:
            guard let url = URL(
                string: Constants.urlPrefix + "\(pokemonId)" + Constants.pngExtension
            ) else { fatalError() }
            return url
        case .pokemonImage:
            guard let url = URL(
                string: Constants.urlPrefix + Constants.urlAnimatedAppendix + "\(pokemonId)" + Constants.gifExtension
            ) else { fatalError() }
            return url
        }
    }
}
