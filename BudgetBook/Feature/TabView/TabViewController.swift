//
//  TabViewController.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/11/05.
//

import UIKit

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabViewControllers()
    }
    
    private func setupTabViewControllers() {
        
        let home = UINavigationController(rootViewController: HomeViewController())
        home.tabBarItem = UITabBarItem(title: "ホーム", image: UIImage(systemName: "house"), tag: 0)
        
        let cashFlow = UINavigationController(rootViewController: CashFlowViewController())
        cashFlow.tabBarItem = UITabBarItem(title: "収支", image: UIImage(systemName: "arrow.left.arrow.right"), tag: 1)
        
        viewControllers = [home, cashFlow]
        selectedIndex = 0
    }
    
}
