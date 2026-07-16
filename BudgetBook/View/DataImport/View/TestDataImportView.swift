//
//  DataImportView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

struct TestDataImportView: View {
    
    @State private var isShowSheet: Bool = false
    @State private var isSelectedMethod: DataImportMethod?
    
    var body: some View {
        NavigationStack {
            if #available(iOS 17.0, *) {
                VStack {
                    Text("3")
                    Button {
                        isShowSheet = true
                    } label: {
                        Text("追加")
                    }
                }
                .onAppear {
                    isShowSheet = true
                }
                .navigationDestination(item: $isSelectedMethod) { method in
                    switch method {
                    case .manual:
                        ManualImportView()
                    case .picture:
                        PictureImportView()
                    case .dataFile:
                        DataFileImportView()
                    }
                }
            } else {
                // Fallback on earlier versions
            }
        }
        .sheet(isPresented: $isShowSheet) {
            if #available(iOS 17.0, *) {
                DataImportMethodView(isSelectedMethod: $isSelectedMethod)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.medium])
                    .presentationCornerRadius(30)
            } else {
                EmptyView()
            }
        }
    }
}

#Preview {
    TestDataImportView()
}
