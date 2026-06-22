//
//  ContentView.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("ホーム", systemImage: "house.fill")
                }
            
            CashFlowView()
                .tabItem {
                    Label("収支", systemImage: "arrow.left.arrow.right")
                }
            
            DataImportMethodView()
                .tabItem {
                }
            
            AnalysisView()
                .tabItem {
                    Label("分析", systemImage: "chart.pie.fill")
                }
            
            SettingView()
                .tabItem {
                    Label("設定", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
