//
//  DataImportMethodView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/29.
//

import SwiftUI

struct DataImportMethodView: View {
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: "keyboard")
                    .resizable()
                    .frame(width: 20, height: 40)
                    .background(Color.black)
                VStack {
                    Text("手入力")
                    Text("手入力")
                }
                .foregroundStyle(Color.black)
            }
        }
    }
}

#Preview {
    DataImportMethodView()
}
