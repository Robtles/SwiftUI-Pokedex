//
//  DefaultsEnumPickerRowView.swift
//
//  Created by Rob on 07/12/2023.
//

#if os(tvOS)
import Defaults
import SwiftUI

/// A Picker row view dedicated to tvOS
public struct DefaultsEnumPickerRowView<T>: View where T: DefaultsEnum {
    // MARK: Environment Properties
    /// The color scheme
    @Environment(\.colorScheme) private var colorScheme
    /// The user defaults
    @Environment(Defaults.self) private var defaults
    
    // MARK: Image Properties
    /// The action on button tap
    let action: () -> Void
    /// If the view needs to be expanded on its trailing constraint
    var needsExpansion: Bool
    /// The DefaultsEnum value
    let value: T
    /// The currently focused value
    let focused: FocusState<T?>.Binding
    
    // MARK: View Properties
    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(value.rowName)
                    .foregroundStyle(
                        focused.wrappedValue == value ?
                            Colors.pickerFocusedText.from(defaults, colorScheme: colorScheme) :
                            Colors.secondaryText.from(defaults, colorScheme: colorScheme)
                    )
                if needsExpansion {
                    Spacer()
                }
            }
        }
        .focused(focused, equals: value)
    }
    
    // MARK: Init Methods
    public init(
        value: T,
        focused: FocusState<T?>.Binding,
        needsExpansion: Bool = false,
        action: @escaping () -> Void
    ) {
        self.action = action
        self.needsExpansion = needsExpansion
        self.value = value
        self.focused = focused
    }
}

struct DefaultsEnumPickerRowViewPreview: PreviewProvider {
        private enum TestDefaults: DefaultsEnum {
            case on
            case off
            
            static var description: String { return "" }
            static var title: String { return "" }
            var rowName: String {
                return switch self {
                case .on: "On"
                case .off: "Off"
                }
            }
            static var sortedAll: [TestDefaults] { return allCases }
        }
    
    static var previews: some View {
        Group {
            DefaultsEnumPickerRowView(
                value: TestDefaults.on,
                focused: FocusState<TestDefaults?>().projectedValue
            ) {}
            .preview(in: .tvOS, displayMode: .light)
            DefaultsEnumPickerRowView(
                value: TestDefaults.on,
                focused: FocusState<TestDefaults?>().projectedValue
            ) {}
            .preview(in: .tvOS, displayMode: .dark)
        }
    }
}
#endif
