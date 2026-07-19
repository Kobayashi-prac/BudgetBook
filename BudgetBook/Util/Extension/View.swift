//
//  View.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/07/18.
//

import SwiftUI

extension View {
    
    func row(_ icon: String, _ title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.black)
            Text(title)
            Spacer()
        }
        .padding()
    }
}
