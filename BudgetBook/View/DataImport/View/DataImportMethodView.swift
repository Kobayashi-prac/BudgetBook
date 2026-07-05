//
//  DataImportMethodView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/29.
//

import SwiftUI

struct DataImportMethodView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                
            } label: {
                HStack(alignment: .center, spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color(.systemGray5))
                            .padding(.horizontal, 20)
                        Image(systemName: "keyboard")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 25, height: 20)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("手入力")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                        Text("金額・カテゴリを直接入力")
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                        .padding(.trailing, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(.secondary, lineWidth: 2)
            }
        }
        // 内部の要素に余白を設ける
        .padding()
    }
}

#Preview {
    DataImportMethodView()
}
