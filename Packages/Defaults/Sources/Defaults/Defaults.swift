//
//  Defaults.swift
//
//  Created by Rob on 19/11/2023.
//

import Model
import SwiftUI

// MARK: - Defaults
/// Contains the user app defaults
@Observable public class Defaults {
    // MARK: Storage
    private class Storage {
        // MARK: Keys
        private enum Key: String {
            case displayMode
            case language
            case sortingOrder
        }
        
        // MARK: Storage Properties
        @AppStorage(Key.displayMode.rawValue) fileprivate var displayMode: DisplayMode = .system
        @AppStorage(Key.language.rawValue) fileprivate var language: Language = Defaults.getLanguage()
        @AppStorage(Key.sortingOrder.rawValue) fileprivate var sortingOrder: SortingOrder = .byIndex
        
        // MARK: Init Methods
        fileprivate init() {}
    }
    
    // MARK: Singleton
    public static let shared = Defaults()
    
    // MARK: Internal Properties
    private let storage = Storage()
    
    // MARK: Init Methods
    init() {
        displayMode = storage.displayMode
        language = storage.language
        sortingOrder = storage.sortingOrder
    }
    
    // MARK: Computed Properties
    /// The Pokédex list display modes
    public var displayMode: DisplayMode {
        didSet {
            storage.displayMode = displayMode
        }
    }
    
    /// The language to use for Pokémon names and descriptions
    public var language: Language {
        didSet {
            storage.language = language
        }
    }
    
    /// The sorting order for Pokédex list
    public var sortingOrder: SortingOrder {
        didSet {
            storage.sortingOrder = sortingOrder
        }
    }
    
    // MARK: Internal Methods
    /// Returns the model language from the user's device preferred language (defaults to English)
    private static func getLanguage() -> Language {
        guard let preferredLanguage = Locale.preferredLanguages.first else {
            return .english
        }
        for language in Language.allCases {
            if preferredLanguage.hasPrefix(language.rawValue) {
                return language
            }
        }
        return .english
    }
}
