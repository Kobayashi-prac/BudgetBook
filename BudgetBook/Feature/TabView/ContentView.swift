//
//  ContentView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GeometryReader { geo in
            TestDataImportView()
                .environment(\.rootSize, geo.size)
        }
    }
}

#Preview {
    ContentView()
}
