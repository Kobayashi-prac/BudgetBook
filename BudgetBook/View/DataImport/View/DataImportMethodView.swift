//
//  DataImportMethodView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/29.
//

import SwiftUI

struct DataImportMethodView: View {
    
    @Environment(\.rootSize) var rootSize: CGSize
    
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
                    Text("\(rootSize.width)")
                }
                .foregroundStyle(Color.black)
            }
        }
        .frame(width: rootSize.width, height: 100)
    }
}

#Preview {
    GeometryReader { geo in
        DataImportMethodView()
            .environment(\.rootSize, geo.size)
    }
}
