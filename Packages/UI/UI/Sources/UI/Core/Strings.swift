//
//  Strings.swift
//
//  Created by Rob on 12/12/2023.
//

import Foundation
import Model
import SwiftUI

// MARK: - Package Strings
enum Strings {
    // MARK: Common
    enum Common {
        static let no: LocalizedStringKey = "common.no"
        static let yes: LocalizedStringKey = "common.yes"
    }
    
    // MARK: Evolution Details
    enum EvolutionDetails {
        enum EvolutionTrigger: String {
            case affection = "affection"
            case beauty = "beauty"
            case happiness = "happiness"
            case levelup = "levelup"
        }
        
        static var shed = NSLocalizedString("evolutiondetails.shed", bundle: .module, comment: "")
        static var trade = NSLocalizedString("evolutiondetails.trade", bundle: .module, comment: "")
        static var withItem = NSLocalizedString("evolutiondetails.withitem", bundle: .module, comment: "")
        static var whenHolding = NSLocalizedString("evolutiondetails.whenholding", bundle: .module, comment: "")
        
        static func levelUp(
            _ trigger: EvolutionDetails.EvolutionTrigger,
            with value: Int
        ) -> String {
            return NSLocalizedString("evolutiondetails." + trigger.rawValue + "levelup", bundle: .module, comment: "")
                .replacingOccurrences(of: "_VALUE_", with: "\(value)")
        }
        
        static func item(for index: Int) -> String {
            return NSLocalizedString("item.\(index)", bundle: .module, comment: "")
        }
    }
    
    // MARK: Pokémon Footer Line View
    enum PokemonFooterLineView {
        static let baby: LocalizedStringKey = "pokemonfooterlineview.baby"
        static let legendary: LocalizedStringKey = "pokemonfooterlineview.legendary"
        static let mythical: LocalizedStringKey = "pokemonfooterlineview.mythical"
    }
    
    // MARK: Pokémon General Stat View
    enum PokemonGeneralStatView {
        static let baseHappiness: LocalizedStringKey = "pokemongeneralstatview.base.happiness"
        static let captureRate: LocalizedStringKey = "pokemongeneralstatview.capture.rate"
        static let height: LocalizedStringKey = "pokemongeneralstatview.height"
        static let heightUnit: LocalizedStringKey = "pokemongeneralstatview.height.unit"
        static let weight: LocalizedStringKey = "pokemongeneralstatview.weight"
        static let weightUnit: LocalizedStringKey = "pokemongeneralstatview.weight.unit"
    }
    
    // MARK: Pokémon Missing View
    enum PokemonMissingView {
        static let information: LocalizedStringKey = "pokemonmissingview.information"
    }
    
    // MARK: Pokémon Text Entries View
    enum PokemonTextEntriesView {
        static let noTextEntry: LocalizedStringKey = "pokemontextentriesview.notextentry"
    }
    
    // MARK: Pokémon Type
    enum PokemonType {
        static func `for`(_ type: Model.PokemonType) -> LocalizedStringKey {
            return LocalizedStringKey(type.nameKey)
        }
    }
    
    // MARK: Time of Day
    enum TimeOfDay {
        static var day = NSLocalizedString("timeofday.day", bundle: .module, comment: "")
        static var night = NSLocalizedString("timeofday.night", bundle: .module, comment: "")
    }
    
    // MARK: Version
    enum Version {
        static let red: LocalizedStringKey = "version.red"
        static let blue: LocalizedStringKey = "version.blue"
        static let yellow: LocalizedStringKey = "version.yellow"
        static let gold: LocalizedStringKey = "version.gold"
        static let silver: LocalizedStringKey = "version.silver"
        static let crystal: LocalizedStringKey = "version.crystal"
        static let ruby: LocalizedStringKey = "version.ruby"
        static let sapphire: LocalizedStringKey = "version.sapphire"
        static let emerald: LocalizedStringKey = "version.emerald"
        static let firered: LocalizedStringKey = "version.firered"
        static let leafgreen: LocalizedStringKey = "version.leafgreen"
        static let diamond: LocalizedStringKey = "version.diamond"
        static let pearl: LocalizedStringKey = "version.pearl"
        static let platinum: LocalizedStringKey = "version.platinum"
        static let heartgold: LocalizedStringKey = "version.heartgold"
        static let soulsilver: LocalizedStringKey = "version.soulsilver"
        static let black: LocalizedStringKey = "version.black"
        static let white: LocalizedStringKey = "version.white"
        static let colosseum: LocalizedStringKey = "version.colosseum"
        static let xd: LocalizedStringKey = "version.xd"
        static let black2: LocalizedStringKey = "version.black2"
        static let white2: LocalizedStringKey = "version.white2"
        static let x: LocalizedStringKey = "version.x"
        static let y: LocalizedStringKey = "version.y"
        static let omegaruby: LocalizedStringKey = "version.omegaruby"
        static let alphasapphire: LocalizedStringKey = "version.alphasapphire"
        static let sun: LocalizedStringKey = "version.sun"
        static let moon: LocalizedStringKey = "version.moon"
        static let ultraSun: LocalizedStringKey = "version.ultraSun"
        static let ultraMoon: LocalizedStringKey = "version.ultraMoon"
        static let letsGoPikachu: LocalizedStringKey = "version.letsGoPikachu"
        static let letsGoEevee: LocalizedStringKey = "version.letsGoEevee"
        static let sword: LocalizedStringKey = "version.sword"
        static let shield: LocalizedStringKey = "version.shield"
        static let theIsleOfArmor: LocalizedStringKey = "version.theIsleOfArmor"
        static let theCrownTundra: LocalizedStringKey = "version.theCrownTundra"
        static let brilliantDiamond: LocalizedStringKey = "version.brilliantDiamond"
        static let shiningPearl: LocalizedStringKey = "version.shiningPearl"
        static let legendsArceus: LocalizedStringKey = "version.legendsArceus"
        static let scarlet: LocalizedStringKey = "version.scarlet"
        static let violet: LocalizedStringKey = "version.violet"
        static let theTealMask: LocalizedStringKey = "version.theTealMask"
        static let theIndigoDisk: LocalizedStringKey = "version.theIndigoDisk"
    }
}
