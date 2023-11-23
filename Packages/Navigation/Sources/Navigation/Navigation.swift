//
//  Navigation.swift
//
//  Created by Rob on 23/11/2023.
//

import SwiftUI

/// This object handles the app navigation (both classic and sheet navigation)
@Observable public class Navigation {
    // MARK: Exposed Properties
    /// The sheet view currently displayed in the application
    public var currentSheetDestination: SheetDestination?
    /// The current navigation path
    public var path: [Destination]
    
    // MARK: Singleton
    public static let shared = Navigation()
    
    // MARK: Init Methods
    private init() {
        path = []
    }
    
    // MARK: Navigation Route Methods
    public func go(to destination: Destination) {
        path.append(destination)
    }
    
    public func pop() {
        path.removeLast()
    }
    
    // MARK: Sheet Methods
    public func showPokemon(id: Int) {
        currentSheetDestination = .pokemonView(id: id)
    }
    
    public func hideCurrentPokemonSheetView() {
        currentSheetDestination = nil
    }
}
