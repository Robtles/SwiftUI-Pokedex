//
//  Formatter+Number.swift
//
//  Created by Rob on 27/11/2023.
//

import Foundation

extension Int {
    /// <#Description#>
    /// - Parameters:
    ///   - digitCount: <#digitCount description#>
    ///   - placeholder: <#placeholder description#>
    /// - Returns: <#description#>
    func formatted(
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
