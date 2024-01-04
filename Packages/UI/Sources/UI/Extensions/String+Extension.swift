//
//  String+Extension.swift
//
//  Created by Rob on 09/12/2023.
//

import Foundation

public extension String {
    var carriageReturnFixed: String {
        return replacingOccurrences(of: "\n", with: " ")
    }
    
    var localized: String {
        return NSLocalizedString(self, bundle: .module, comment: "")
    }
}
