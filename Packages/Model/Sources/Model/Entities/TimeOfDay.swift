//
//  TimeOfDay.swift
//
//  Created by Rob on 27/10/2023.
//

import Foundation

// MARK: - Time of Day
/// Defines a specific time of day
public enum TimeOfDay: String, Codable, CodingKeyRepresentable, Equatable, Hashable {
    // MARK: Cases
    /// Day time
    case day = "day"
    /// Night time
    case night = "night"
    
    // MARK: Init Methods
    public init?(_ rawValue: String) {
        guard let timeOfDay = TimeOfDay(rawValue: rawValue) else {
            return nil
        }
        self = timeOfDay
    }
}
