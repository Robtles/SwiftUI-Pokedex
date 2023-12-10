//
//  ErrorPopupModifier.swift
//
//  Created by Rob on 10/12/2023.
//

import SwiftUI

// MARK: - Error Popup Modifier
public struct ErrorPopupModifier: ViewModifier {
    // MARK: Properties
    public var errorMessage: String?
    
    // MARK: View Properties
    public func body(content: Content) -> some View {
        return ZStack {
            content
            if let errorMessage {
                VStack {
                    Spacer()
                    ErrorPopupView(
                        errorMessage: errorMessage
                    )
                }
                .padding()
            }
        }
    }
    
    // MARK: Init Methods
    public init(errorMessage: String?) {
        self.errorMessage = errorMessage
    }
}
