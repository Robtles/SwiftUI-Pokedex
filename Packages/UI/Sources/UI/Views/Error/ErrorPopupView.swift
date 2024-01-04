//
//  ErrorPopupView.swift
//
//  Created by Rob on 10/12/2023.
//

import Defaults
import SwiftUI

// MARK: - Error Popup View
public struct ErrorPopupView: View {
    // MARK: Constants
    private enum Constants {
        fileprivate static let backgroundColor = Color.red
        fileprivate static let textColor = Color.white
    }

    // MARK: Properties
    public let errorMessage: String
    
    // MARK: View Properties
    public var body: some View {
        Text(errorMessage)
            .padding(.horizontal, 16.0)
            .padding(.vertical, 8.0)
            .foregroundStyle(
                Constants.textColor
            )
            .background(
                Constants.backgroundColor
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 16.0
                        )
                    )
            )
    }
    
    // MARK: Init Methods
    public init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
}

struct ErrorPopupViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Platform.allCases, id: \.self) { platform in
                VStack {
                    Spacer()
                    ErrorPopupView(errorMessage: "Something went wrong")
                        .preview(in: platform)
                }
                .padding()
            }
        }
    }
}
