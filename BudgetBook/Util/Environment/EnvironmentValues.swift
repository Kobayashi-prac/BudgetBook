//
//  EnvironmentValues.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/30.
//

import SwiftUI

extension EnvironmentValues {
    var rootSize: CGSize {
        // EnvironmentValuesが暗黙的に持つstorageにget/set
        get { self[RootSizeKey.self] }
        set { self[RootSizeKey.self] = newValue }
    }
}

struct RootSizeKey: EnvironmentKey {
    // valueのデフォルト値と型を指定
    static let defaultValue: CGSize = .zero
}
