//
//  Common.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Shared code for this model
/// A dictionary containing localizations: the key is the language and the value the localized string
public typealias LocalizedContentDictionary = [Language: String]

/// A dictionary containing localized texts for given versions
public typealias LocalizedVersionedContentDictionary = [Version: LocalizedContentDictionary]
