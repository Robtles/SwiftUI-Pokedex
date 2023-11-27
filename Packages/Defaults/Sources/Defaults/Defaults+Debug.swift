//
//  Defaults+Debug.swift
//
//  Created by Rob on 27/11/2023.
//

import Foundation
import Model

/// Testable UserDefaults with dark mode enabled
public func darkUserDefaults(
    with language: Language = .english
) -> Defaults {
    let userDefaults = Defaults()
    userDefaults.displayMode = .dark
    userDefaults.language = language
    return userDefaults
}

/// Testable UserDefaults with light mode enabled
public func lightUserDefaults(
    with language: Language = .english
) -> Defaults {
    let userDefaults = Defaults()
    userDefaults.displayMode = .light
    userDefaults.language = language
    return userDefaults
}
