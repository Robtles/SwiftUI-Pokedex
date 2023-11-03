//
//  Language.swift
//
//  Created by Rob on 29/10/2023.
//

import Foundation

// MARK: - Language
/// The languages available with Pokeapi.co API
public enum Language: String, CaseIterable {
    // MARK: Cases
    /// The German language
    case deutsch = "de"
    /// The English language
    case english = "en"
    /// The Spanish language
    case spanish = "es"
    /// The French language
    case french = "fr"
    /// The Italian language
    case italian = "it"
    /// The Japanese language with basic representation (kanas & kanjis)
    case baseJapanese = "ja"
    /// The Japanese language with only hiraganas and katakanas
    case kanaJapanese = "ja-Hrkt"
    /// The Japanese language with romaji representation
    case romajiJapanese = "roomaji"
    /// The Korean language
    case korean = "이상해풀"
    /// The Chinese language with simplified representation
    case simplifiedChinese = "zh-Hans"
    /// The Chinese language with traditional representation
    case traditionalChinese = "zh-Hant"
}
