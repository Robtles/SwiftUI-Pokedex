//
//  Formatter+Number.swift
//
//  Created by Rob on 27/11/2023.
//

import Foundation

extension Int {
    /// Formats an integer with the specified parameters
    /// - Parameters:
    ///   - digitCount: The integer digit count
    ///   - placeholder: The placeholder if integer could not be formatted to a string
    public func formatted(
        withDigits digitCount: Int,
        placeholder: String = ""
    ) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = digitCount
        return numberFormatter.string(
            from: NSNumber(
                value: self
            )
        ) ?? placeholder
    }
}
