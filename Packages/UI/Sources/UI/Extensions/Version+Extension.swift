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
        case Version.black: Strings.Version.black
        case Version.white: Strings.Version.white
        case Version.colosseum: Strings.Version.colosseum
        case Version.xd: Strings.Version.xd
        case Version.black2: Strings.Version.black2
        case Version.white2: Strings.Version.white2
        case Version.x: Strings.Version.x
        case Version.y: Strings.Version.y
        case Version.omegaRuby: Strings.Version.omegaruby
        case Version.alphaSapphire: Strings.Version.alphasapphire            
        case Version.sun: Strings.Version.sun
        case Version.moon: Strings.Version.moon
        case Version.ultraSun: Strings.Version.ultraSun
        case Version.ultraMoon: Strings.Version.ultraMoon
        case Version.letsGoPikachu: Strings.Version.letsGoPikachu
        case Version.letsGoEevee: Strings.Version.letsGoEevee
        case Version.sword: Strings.Version.sword
        case Version.shield: Strings.Version.shield
        case Version.theIsleOfArmor: Strings.Version.theIsleOfArmor
        case Version.theCrownTundra: Strings.Version.theCrownTundra
        case Version.brilliantDiamond: Strings.Version.brilliantDiamond
        case Version.shiningPearl: Strings.Version.shiningPearl
        case Version.legendsArceus: Strings.Version.legendsArceus
        case Version.scarlet: Strings.Version.scarlet
        case Version.violet: Strings.Version.violet
        case Version.theTealMask: Strings.Version.theTealMask
        case Version.theIndigoDisk: Strings.Version.theIndigoDisk
        default: nil
        }
    }
}
