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

enum TransactionCategory: CaseIterable, Identifiable {
    
    var id: Self {
        self
    }
    
    /// 食費
    case food
    /// 日用品
    case dailyGoods
    /// 交通
    case transport
    /// 住居
    case housing
    /// 娯楽
    case entertainment
    /// 医療
    case medical
    /// カフェ
    case cafe
    /// その他
    case other
    
    var name: String {
        switch self {
        case .food:
            return "食費"
        case .dailyGoods:
            return "日用品"
        case .transport:
            return "交通"
        case .housing:
            return "住居"
        case .entertainment:
            return "娯楽"
        case .medical:
            return "医療"
        case .cafe:
            return "カフェ"
        case .other:
            return "その他"
        }
    }
    
    var iconName: String {
        switch self {
        case .food:
            return "fork.knife"
        case .dailyGoods:
            return "bag.fill"
        case .transport:
            return "tram.fill"
        case .housing:
            return "house"
        case .entertainment:
            return "gamecontroller"
        case .medical:
            return "heart.text.square"
        case .cafe:
            return "cup.and.saucer"
        case .other:
            return "ellipsis"
        }
    }
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
            
            // TODO: .focused($isFocused)で下にズレる
            // TODO: 横幅の制限
            // TODO: 円の表示
            TextField("0", value: $amount, format: .number)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .fixedSize()
                .multilineTextAlignment(.center)
                .focused($isFocused)
                .keyboardType(.numberPad)
                .onAppear {
                    isFocused = true
                }
            
            CategoryView()
            
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
                     // TODO: 高さかpaddingか
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

struct CategoryView: View {
    
    @State private var isSelectedCategory: TransactionCategory?
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        VStack {
            Text("カテゴリ")
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns) {
                ForEach(TransactionCategory.allCases) { category in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 55, height: 55)
                                .foregroundStyle(Color(.systemGray5))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(
                                        isSelectedCategory == category ? .black : .clear,
                                        lineWidth: 2
                                    )
                                )
                            Image(systemName: category.iconName)
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.black)
                                .frame(width: 22, height: 22)
                        }
                        .onTapGesture {
                            isSelectedCategory = category
                        }
                        Text("\(category.name)")
                            .opacity(isSelectedCategory == category ? 1 : 0.5)
                            .font(.system(size: 15))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ManualImportView()
}
