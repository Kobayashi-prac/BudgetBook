//
//  DataImportView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

struct TestDataImportView: View {
    
    @State var isShowSheet: Bool = false
        
    var body: some View {
        VStack {
            Text("3")
            Button {
                isShowSheet = true
            } label: {
                Text("追加")
            }
        }
        .sheet(isPresented: $isShowSheet) {
            DataImportMethodView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium])
                .presentationCornerRadius(30)
        }
    }
}

#Preview {
    TestDataImportView()
}
