//
//  BudgetBookApp.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

@main
struct BudgetBookApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { geo in
                ContentView()
                    .environment(\.rootSize, geo.size)
            }
        }
    }
}
