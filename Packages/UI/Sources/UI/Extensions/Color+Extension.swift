//
//  Color+Extension.swift
//
//  Created by Rob on 27/11/2023.
//

import SwiftUI

/// Handy Color extensions
extension Color {
    /// Initializes a Color with a hexadecimal value. Usage: Color(hex: 0x10AB23)
    init(
        hex: UInt, 
        alpha: Double = 1.0
    ) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
