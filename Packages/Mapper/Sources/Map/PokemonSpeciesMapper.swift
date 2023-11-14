//
//  PokemonSpeciesMapper.swift
//
//  Created by Rob on 12/11/2023.
//

import Foundation
import Model

struct PokemonSpeciesMapper {
    // MARK: Internal Pokemon Species Mapping
    static func getTextEntries(
        from textEntriesRepresentation: [FlavorTextJSONEntity]
    ) -> LocalizedVersionedContentDictionary {
        return textEntriesRepresentation.reduce(into: [:]) { partialResult, jsonFlavorText in
            guard let versionID = jsonFlavorText.version.id,
                  let language = Language(rawValue: jsonFlavorText.language.name) else {
                return
            }
            partialResult[versionID, default: [:]][language] = jsonFlavorText.flavorText
        }
    }
}
