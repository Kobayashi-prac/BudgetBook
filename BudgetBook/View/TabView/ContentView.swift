//
//  ContentView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            /// ホーム
            HomeView()
                .tabItem {
                    Label("ホーム", systemImage: "house.fill")
                }
                .tag(0)
            
            /// 収支
            CashFlowView()
                .tabItem {
                    Label("収支", systemImage: "arrow.left.arrow.right")
                }
                .tag(1)
            
            /// データ取り込み
            DataImportMethodView(selection: $selectedTab)
                .tabItem {
                    Label("追加", systemImage: "plus")
                }
                .tag(2)
            
            /// 分析
            AnalysisView()
                .tabItem {
                    Label("分析", systemImage: "chart.pie.fill")
                }
                .tag(3)
            
            /// 設定
            SettingView()
                .tabItem {
                    Label("設定", systemImage: "gearshape")
                }
                .tag(4)
        }
    }
}

#Preview {
    ContentView()
}
