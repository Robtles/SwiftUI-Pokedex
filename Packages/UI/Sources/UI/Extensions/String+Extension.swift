//
//  String+Extension.swift
//
//  Created by Rob on 09/12/2023.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
