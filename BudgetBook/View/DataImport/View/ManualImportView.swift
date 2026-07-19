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

enum TransactionCategory {
    
}

struct ManualImportView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var amount: Int?
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TransactionTypeTab()
                .padding()
            
            Text("金額")
                .opacity(0.5)
            
            TextField("0", value: $amount, format: .number)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .fixedSize()
                .multilineTextAlignment(.center)
                .focused($isFocused)
                .keyboardType(.numberPad)
                .onAppear {
                    isFocused = true
                }
            
            VStack {
                Text("カテゴリ")
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            Spacer()
        }
        .onTapGesture {
            isFocused = false
        }
        .navigationTitle("取引を追加")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    isFocused = false
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Text("保存")
            }
        }
    }
}

struct TransactionTypeTab: View {
    
    @Namespace private var select
    
    @State private var selection: Int = 0
    
    let transactions = TransactionType.allCases
    
    var body: some View {
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
}

#Preview {
    ManualImportView()
}
