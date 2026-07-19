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
    
    var subcategories: [String] {
        switch self {
        case .food:
            return ["レストラン"]
        case .dailyGoods:
            return ["スーパー", "ドラッグストア"]
        case .transport:
            return []
        case .housing:
            return []
        case .entertainment:
            return []
        case .medical:
            return []
        case .cafe:
            return []
        case .other:
            return []
        }
    }
}

struct ManualImportView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isSelectedCategory: TransactionCategory?
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TransactionTypeTab()
                .padding()
            
            amountImputView(isFocused: _isFocused)
            
            CategoryView(isSelectedCategory: $isSelectedCategory)
            
            DetailView(isSelectedCategory: $isSelectedCategory)
            
            Spacer()
        }
        .onTapGesture {
            isFocused = false
            isSelectedCategory = nil
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
        .background(Color(.systemGroupedBackground))
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

struct amountImputView: View {
    
    @State private var amount: Int?
    @FocusState var isFocused: Bool
    
    var body: some View {
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
    }
}

struct CategoryView: View {
    
    @Binding var isSelectedCategory: TransactionCategory?
    
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
        // TODO: 範囲外をタップしたら選択解除
        .onTapGesture {
            isSelectedCategory = nil
        }
    }
}

struct DetailView: View {
    
    @State private var subcategory: String = ""
    @State private var selectedDate: Date = Date()
    
    @Binding var isSelectedCategory: TransactionCategory?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                row("calendar", "日付")
                Spacer()
                ZStack {
                    DatePicker("",
                               selection: $selectedDate,
                               displayedComponents: [.date])
                    .labelsHidden()
                    .colorMultiply(.clear)
                    Text(selectedDate,
                         format: Date.FormatStyle(date: .numeric)
                        .locale(Locale(identifier: "ja_JP")))
                    .foregroundStyle(.secondary)
                }
            }
            Divider()
            HStack {
                row("creditcard", "お店・摘要")
                Spacer()
                if let category = isSelectedCategory {
                    Menu {
                        Picker("", selection: $subcategory) {
                            ForEach(category.subcategories, id: \.self) { category in
                                Text(category)
                            }
                        }
                    } label: {
                        Text(subcategory.isEmpty ? category.subcategories.first ?? "" : subcategory)
                            .foregroundStyle(.black)
                            .opacity(0.5)
                            .padding()
                    }
                }
            }
        }
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

#Preview {
    ManualImportView()
}
