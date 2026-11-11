//
//  HomeViewModel.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/11/11.
//

enum CellType: CaseIterable {
    case daily
    case monthly
    
    var cellClass: AnyClass {
        switch self {
        case .daily:
            return DailyCashFlowCell.self
        case .monthly:
            return MonthlyCashFlowCell.self
        }
    }
    
    var identifier: String {
        switch self {
        case .daily:
            return "dailyCashFlow"
        case .monthly:
            return "monthlyCashFlow"
        }
    }
}

class HomeViewModel {
    
    let cellType: [CellType] = CellType.allCases

}
