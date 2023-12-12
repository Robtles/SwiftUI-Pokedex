//
//  Common.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Shared code for this model
public typealias VersionID = Int

/// A dictionary containing localizations: the key is the language and the value the localized string
public typealias LocalizedContentDictionary = [Language: String]

/// A dictionary containing localized texts for given versions
public typealias LocalizedVersionedContentDictionary = [VersionID: LocalizedContentDictionary]

/// A dictionary containing localized texts for given indexes
public typealias LocalizedIndexedContentDictionary = [Int: LocalizedContentDictionary]
