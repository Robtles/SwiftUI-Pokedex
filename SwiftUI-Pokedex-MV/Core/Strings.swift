//
//  Strings.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 09/12/2023.
//

import Foundation

// MARK: - App Strings
enum Strings {
    // MARK: Display Mode Strings
    enum DisplayMode {
        enum Mode {
            static let dark = "displaymode.mode.dark"
            static let light = "displaymode.mode.light"
            static let system = "displaymode.mode.system"
        }
                
        static let description = "displaymode.description"
        static let title = "displaymode.title"
    }
    
    // MARK: Language Strings
    enum Language {
        enum Case {
            static let deutsch = "language.case.deutsch"
            static let english = "language.case.english"
            static let spanish = "language.case.spanish"
            static let french = "language.case.french"
            static let italian = "language.case.italian"
            static let baseJapanese = "language.case.baseJapanese"
            static let kanaJapanese = "language.case.kanaJapanese"
            static let romajiJapanese = "language.case.romajiJapanese"
            static let korean = "language.case.korean"
            static let simplifiedChinese = "language.case.simplifiedChinese"
            static let traditionalChinese = "language.case.traditionalChinese"
        }
                
        static let description = "language.description"
        static let title = "language.title"
    }
    
    // MARK: Pokedex Navigation View Strings
    enum PokedexNavigationView {
        static let title = "pokedexnavigationview.title"
        static let toolbarButton = "pokedexnavigationview.toolbarButton"
    }
    
    // MARK: Settings
    enum Settings {
        static let title = "settingsview.title"
    }
    
    // MARK: Sorting Order
    enum SortingOrder {
        enum Case {
            static let byIndex = "sortingorder.case.byIndex"
            static let byName = "sortingorder.case.byName"
        }
        
        static let description = "sortingorder.description"
        static let title = "sortingorder.title"
    }
}
