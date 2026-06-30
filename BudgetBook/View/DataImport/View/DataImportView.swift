//
//  DataImportView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

struct DataImportView: View {
    
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
                .presentationCornerRadius(8)
        }
    }
}

#Preview {
    DataImportView()
}
