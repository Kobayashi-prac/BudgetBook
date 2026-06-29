//
//  DataImportMethodView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

struct DataImportMethodView: View {
    
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            Text("3")
            Button {
                selection = 1
            } label: {
                Text("ボタン")
            }
        }
    }
}

#Preview {
    DataImportMethodView(selection: .constant(1))
}
