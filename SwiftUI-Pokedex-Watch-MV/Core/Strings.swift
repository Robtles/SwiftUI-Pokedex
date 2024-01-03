//
//  Strings.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Foundation
import SwiftUI

enum Strings {
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
    
    // MARK: Settings View
    enum SettingsView {
        static let language: LocalizedStringKey = "settings.view.button.language"
        static let sortingOrder: LocalizedStringKey = "settings.view.button.sorting.order"
        static let title: LocalizedStringKey = "settings.view.title"
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
