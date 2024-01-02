//
//  Version+Extension.swift
//
//  Created by Rob on 22/12/2023.
//

import Foundation
import Model
import SwiftUI

extension VersionID {
    var localizedStringKey: LocalizedStringKey? {
        return switch self {
        case Version.red: Strings.Version.red
        case Version.blue: Strings.Version.blue
        case Version.yellow: Strings.Version.yellow
        case Version.gold: Strings.Version.gold
        case Version.silver: Strings.Version.silver
        case Version.crystal: Strings.Version.crystal
        case Version.ruby: Strings.Version.ruby
        case Version.sapphire: Strings.Version.sapphire
        case Version.emerald: Strings.Version.emerald
        case Version.fireRed: Strings.Version.firered
        case Version.leafGreen: Strings.Version.leafgreen
        case Version.diamond: Strings.Version.diamond
        case Version.pearl: Strings.Version.pearl
        case Version.platinum: Strings.Version.platinum
        case Version.heartGold: Strings.Version.heartgold
        case Version.soulSilver: Strings.Version.soulsilver
        case Version.omegaRuby: Strings.Version.omegaruby
        case Version.alphaSapphire: Strings.Version.alphasapphire
        default: nil
        }
    }
}
