//
//  ErrorManager.swift
//
//  Created by Rob on 10/12/2023.
//

import Model
import SwiftUI

// MARK: - Error Manager
/// The error manager
@Observable public final class ErrorManager {
    // MARK: Singleton
    public static let shared = ErrorManager()
    
    // MARK: Properties
    public var currentErrorMessage: String?
    
    // MARK: Error Methods
    public func display(
        _ error: String,
        seconds: TimeInterval = 2.0
    ) {
        currentErrorMessage = error
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [weak self] in
            guard let self else { return }
            currentErrorMessage = nil
        }
    }
}
