//
//  DataImportView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

struct TestDataImportView: View {
    
    @State private var isShowSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // ダミー
                VStack {
                    Text("3")
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isShowSheet = true
                        }
                    } label: {
                        Text("追加")
                    }
                }
                .onAppear {
                    isShowSheet = true
                }
                
                // sheet表示
                if isShowSheet {
                    // 半透明の背景
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isShowSheet = false
                            }
                        }
                        .transition(.opacity)
                    
                    // sheet風のパネル
                    DataImportMethodView(isShowSheet: $isShowSheet)
                    .frame(height: 500)
                    .background(Color.white)
                    .cornerRadius(20)
                    .offset(x: 0, y: 200)
                    .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

#Preview {
    TestDataImportView()
}
