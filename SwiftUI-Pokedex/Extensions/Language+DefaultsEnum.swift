//
//  Language+DefaultsEnum.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
import Foundation
import Model
import UI

// MARK: - Language DefaultsEnum Conformance
extension Language: DefaultsEnum {
    // MARK: Static Properties
    public static let description: String = "Selects in which language the Pokémon information will be displayed. Doesn't change the current app language."
    public static let sortedAll: [Language] = Language.allCases.sorted { $0.rowName < $1.rowName }
    public static let title: String = "Language"
    
    // MARK: Properties
    public var rowName: String {
        return switch Platform.current {
        case .tvOS: flag + " " + "(" + name + ")"
        default: name
        }
    }
}

// MARK: - Language Flag & Name Extension
fileprivate extension Language {
    var flag: String {
        return switch self {
        case .deutsch: "🇩🇪"
        case .english: "🇬🇧"
        case .spanish: "🇪🇸"
        case .french: "🇫🇷"
        case .italian: "🇮🇹"
        case .baseJapanese, .kanaJapanese, .romajiJapanese: "🇯🇵"
        case .korean: "🇰🇷"
        case .simplifiedChinese, .traditionalChinese: "🇨🇳"
        }
    }
    
    var name: String {
        return switch self {
        case .deutsch: "Deutsch"
        case .english: "English"
        case .spanish: "Spanish"
        case .french: "French"
        case .italian: "Italian"
        case .baseJapanese: "Japanese"
        case .kanaJapanese: "Kana Japanese"
        case .romajiJapanese: "Romaji Japanese"
        case .korean: "Korean"
        case .simplifiedChinese: "Simplified Chinese"
        case .traditionalChinese: "Traditional Chinese"
        }
    }
}
