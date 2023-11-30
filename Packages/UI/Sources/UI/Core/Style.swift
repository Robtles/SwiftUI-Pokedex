//
//  Style.swift
//
//  Created by Rob on 30/11/2023.
//

#if os(iOS)
import UIKit
#endif

// MARK: - Style
public enum Style {
    /// Applies the global app style
    public static func apply() {
        #if os(iOS)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.red
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ].compactMapValues { $0 }
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ].compactMapValues { $0 }
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor.white
        #endif
    }
}
