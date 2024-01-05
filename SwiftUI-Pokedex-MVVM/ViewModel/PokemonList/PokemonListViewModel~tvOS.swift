//
//  PokemonListViewModel~tvOS.swift
//  SwiftUI-Pokedex-MVVM
//
//  Created by Rob on 05/01/2024.
//

import Foundation
import Model
import SwiftUI

#if os(tvOS)
// MARK: - Pokémon List View Model (tvOS specific)
extension PokemonListViewModel {
    // MARK: Type Properties
    private enum Constants {
        fileprivate static let advanceThreshold = 50
    }
    
    private enum ListAdvanceDirection {
        case up, down
    }
    
    // MARK: Methods
    func handleMoveCommand(proxy: ScrollViewProxy) -> (MoveCommandDirection) -> Void {
        return { [weak self] direction in
            guard let self else { return }
            switch direction {
            case .left:
                advanceInList(.up, proxy)
            case .right:
                advanceInList(.down, proxy)
            default:
                return
            }
        }
    }
    
    private func advanceInList(
        _ direction: ListAdvanceDirection,
        _ proxy: ScrollViewProxy
    ) {
        withAnimation {
            let newFocus = switch direction {
            case .down: min(Pokemon.Constants.maximumId, (focused ?? Pokemon.Constants.minimumId) + Constants.advanceThreshold)
            case .up: max(Pokemon.Constants.minimumId, (focused ?? Pokemon.Constants.minimumId) - Constants.advanceThreshold)
            }
            focused = newFocus
            proxy.scrollTo(newFocus, anchor: .top)
        }
    }
}
#endif
