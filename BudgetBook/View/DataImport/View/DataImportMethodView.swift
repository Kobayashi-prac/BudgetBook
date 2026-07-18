//
//  DataImportMethodView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/29.
//

import SwiftUI

enum DataImportMethod: CaseIterable, Identifiable {
    case manual
    case picture
    case dataFile
    
    var id: Self {
        self
    }
    
    var iconName: String {
        switch self {
        case .manual:
            return "keyboard"
        case .picture:
            return "camera"
        case .dataFile:
            return "arrow.up.doc"
        }
    }
    
    var upperText: String {
        switch self {
        case .manual:
            return "手入力"
        case .picture:
            return "レシート撮影"
        case .dataFile:
            return "CSV/PDF 取り込み"
        }
    }
    
    var lowerText: String {
        switch self {
        case .manual:
            return "金額・カテゴリを直接入力"
        case .picture:
            return "撮影して自動で読み取り"
        case .dataFile:
            return "明細ファイルから一括登録"
        }
    }
}

struct DataImportMethodView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var isSelectedMethod: DataImportMethod?
    
    @Binding var isShowSheet: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            
            // 種別選択
            Text("追加方法を選択してください")
                .fontWeight(.semibold)
            ForEach(DataImportMethod.allCases) { method in
                Button {
                    isSelectedMethod = method
                } label: {
                    MethodView(method: method)
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .buttonStyle(MethodButtonStyle(isSelected: isSelectedMethod == method))
            }
            
            // キャンセルボタン
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isShowSheet = false
                }
            } label: {
                Text("キャンセル")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
        }
        // 内部の要素に余白を設ける
        .padding()
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
    }
}

struct MethodView: View {
    
    var method: DataImportMethod
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(Color(.systemGray5))
                    .padding(.horizontal, 20)
                Image(systemName: method.iconName)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black)
                    .frame(width: 25, height: 20)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(method.upperText)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.black)
                Text(method.lowerText)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .padding(.trailing, 20)
        }
    }
}

struct MethodButtonStyle: ButtonStyle {
    
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color(.secondarySystemBackground) : Color(.systemBackground))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(
                        isSelected ? Color.primary : .gray,
                        lineWidth: 2
                    )
            }
            .opacity(configuration.isPressed ? 0.7 : 1)  // 押下フィードバック
    }
}

#Preview {
    DataImportMethodView(isShowSheet: .constant(true))
}
