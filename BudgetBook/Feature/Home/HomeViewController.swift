//
//  HomeViewController.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/11/06.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "ホーム"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = ColorResource.navigationBarColor
        appearance.titleTextAttributes = [.foregroundColor: ColorResource.defaultTextColor ?? .black,
                                          .font: UIFont.systemFont(ofSize: 17, weight: .bold)]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        tableView.backgroundColor = ColorResource.defaultBackgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
}
