//
//  ManualImportView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/07/16.
//

import SwiftUI

enum TransactionType: String, CaseIterable {
    case expense = "支出"
    case income = "収入"
}

struct ManualImportView: View {
    
    @Namespace private var select
    
    @State private var selection: Int = 0
    
    let transactions = TransactionType.allCases
    
    var body: some View {
        VStack {
            Group {
                HStack(spacing: 0) {
                    ForEach(transactions.indices, id: \.self) { index in
                        Text(transactions[index].rawValue)
                            .font(.subheadline.bold())
                            .foregroundStyle(selection == index ? .white : .secondary)
                            .frame(maxWidth: .infinity)
                            // 高さかpaddingか
                            .padding(.vertical, 10)
                            .background {
                                if selection == index {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.red)
                                        .matchedGeometryEffect(id: "selectType",
                                                               in: select)
                                }
                            }
                            .contentShape(.rect)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    selection = index
                                }
                            }
                    }
                }
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray5))
                )
            }
            .padding()
        }
        .navigationTitle("取引を追加")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Text("保存")
            }
        }
    }
}

#Preview {
    ManualImportView()
}
