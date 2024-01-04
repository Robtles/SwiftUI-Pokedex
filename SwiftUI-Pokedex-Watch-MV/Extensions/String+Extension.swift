//
//  String+Extension.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import Foundation

extension String {
    var carriageReturnFixed: String {
        return replacingOccurrences(of: "\n", with: " ")
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
