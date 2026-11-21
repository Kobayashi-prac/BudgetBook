//
//  HomeViewController.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/11/06.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        registerCell()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "ホーム"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = ColorResource.navigationBarColor
        appearance.titleTextAttributes = [.foregroundColor: ColorResource.defaultTextColor ?? .black,
                                          .font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ColorResource.defaultBackgroundColor
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    private func registerCell() {
        viewModel.cellType.forEach { type in
            tableView.register(type.cellClass, forCellReuseIdentifier: type.identifier)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let cellType = viewModel.cellType[indexPath.row]
        switch cellType {
        case .daily:
            // dequeueで生成されたセルはキャストに失敗してもテーブルビュー上のその行の位置に置くところまで進めている（推測）
            guard let dailyCell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier,
                                                                for: indexPath) as? DailyCashFlowCell else {
                // dailyCellとcellが二重に表示される
                return cell
            }
            cell = dailyCell
        case .monthly:
            guard let monthlyCell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier,
                                                                  for: indexPath) as? MonthlyCashFlowCell else {
                return cell
            }
            cell = monthlyCell
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
