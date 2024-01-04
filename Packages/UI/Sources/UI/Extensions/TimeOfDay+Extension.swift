//
//  TimeOfDay+Extension.swift
//
//  Created by Rob on 02/01/2024.
//

import Foundation
import Model

// MARK: - Time Of Day Extension
extension TimeOfDay {
    var texts: [String] {
        return switch self {
        case .day:
            ["☀️ ", Strings.TimeOfDay.day]
        case .night:
            ["🌚 ", Strings.TimeOfDay.night]
        }
    }
}
