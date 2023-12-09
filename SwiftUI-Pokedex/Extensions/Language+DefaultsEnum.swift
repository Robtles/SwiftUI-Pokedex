//
//  Language+DefaultsEnum.swift
//  SwiftUI-Pokedex-MV
//
//  Created by Rob on 01/12/2023.
//

import Defaults
import Foundation
import Model
import SwiftUI
import UI

// MARK: - Language DefaultsEnum Conformance
extension Language: DefaultsEnum {
    // MARK: Static Properties
    public static let description: String = Strings.Language.description.localized
    public static let sortedAll: [Language] = Language.allCases.sorted { $0.rawValue < $1.rawValue }
    public static let title: String = Strings.Language.title.localized
    
    // MARK: Properties
    public var rowName: String {
        return switch Platform.current {
        case .tvOS: flag + " " + name
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
        case .deutsch: Strings.Language.Case.deutsch.localized
        case .english: Strings.Language.Case.english.localized
        case .spanish: Strings.Language.Case.spanish.localized
        case .french: Strings.Language.Case.french.localized
        case .italian: Strings.Language.Case.italian.localized
        case .baseJapanese: Strings.Language.Case.baseJapanese.localized
        case .kanaJapanese: Strings.Language.Case.kanaJapanese.localized
        case .romajiJapanese: Strings.Language.Case.romajiJapanese.localized
        case .korean: Strings.Language.Case.korean.localized
        case .simplifiedChinese: Strings.Language.Case.simplifiedChinese.localized
        case .traditionalChinese: Strings.Language.Case.traditionalChinese.localized
        }
    }
}
