//
//  DefaultsEnum.swift
//
//  Created by Rob on 01/12/2023.
//

import Foundation

// MARK: - Defaults Enum
/// A protocol to make grouping defaults cases easily
public protocol DefaultsEnum: Hashable, CaseIterable where AllCases: RandomAccessCollection {
    // MARK: Properties
    /// The type description
    static var description: String { get }
    /// The type title
    static var title: String { get }
    /// The row title
    var rowName: String { get }
    /// All cases but sorted as wanted for picker/list purposes
    static var sortedAll: [Self] { get }
}
