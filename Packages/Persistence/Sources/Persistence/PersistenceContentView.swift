//
//  PersistenceContentView.swift
//
//  Created by Rob on 16/01/2024.
//

import Model
import SwiftData
import SwiftUI

// MARK: - Persistence Content View
public struct PersistenceContentView: View {
    // MARK: Environment Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var content: [PersistenceContent]
    
    // MARK: View
    public var contentView: (PersistenceContent) -> any View
    public var loadingView: (ModelContext) -> any View
    
    // MARK: View Properties
    public var body: some View {
        if let content = content.first {
            AnyView(contentView(content))
        } else {
            AnyView(loadingView(modelContext))
        }
    }
    
    // MARK: Init Methods
    public init(
        contentView: @escaping (PersistenceContent) -> any View,
        loadingView: @escaping (ModelContext) -> any View
    ) {
        self.contentView = contentView
        self.loadingView = loadingView
    }
}
