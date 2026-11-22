//
//  DailyCashFlowCell.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/11/11.
//

import UIKit

class DailyCashFlowCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let incomeView = UIStackView()
    let expenseView = UIStackView()
    let DetailView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = ColorResource.defaultBackgroundColor
        setupTitleLabel()
        setupDateLabel()
        setupIncomeView()
        setupExpenseView()
        setupDetailView()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "今日の収支"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11)
        ])

    }
    
    private func setupDateLabel() {
        dateLabel.text = "\(Date.now.formatted(.dateTime.month().day().weekday().locale(Locale(identifier: "ja_JP"))))"
        contentView.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            dateLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    private func setupIncomeView() {
        let incomeLabel = UILabel()
        incomeLabel.text = "収入"
        incomeLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        let amountLabel = UILabel()
        amountLabel.text = "+¥ 1000"
        amountLabel.font = .systemFont(ofSize: 20)
        
        incomeView.addArrangedSubview(incomeLabel)
        incomeView.addArrangedSubview(amountLabel)
        
        // incomeView.isHidden = true
        incomeView.backgroundColor = .white
        incomeView.axis = .horizontal
        incomeView.alignment = .center
        incomeView.layer.cornerRadius = 8
        incomeView.distribution = .fill
        incomeView.isLayoutMarginsRelativeArrangement = true
        incomeView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 25,
                                                                      leading: 20,
                                                                      bottom: 25,
                                                                      trailing: 20)
        
        contentView.addSubview(incomeView)
        
        incomeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            incomeView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            incomeView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            incomeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            incomeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
    
    private func setupExpenseView() {
        let expenseLabel = UILabel()
        expenseLabel.text = "支出"
        expenseLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        let amountLabel = UILabel()
        amountLabel.text = "-¥ 1000"
        amountLabel.font = .systemFont(ofSize: 20)
        
        expenseView.addArrangedSubview(expenseLabel)
        expenseView.addArrangedSubview(amountLabel)
        
        expenseView.backgroundColor = .white
        expenseView.axis = .horizontal
        expenseView.alignment = .center
        expenseView.layer.cornerRadius = 8
        expenseView.distribution = .fill
        expenseView.isLayoutMarginsRelativeArrangement = true
        expenseView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 25,
                                                                      leading: 20,
                                                                      bottom: 25,
                                                                      trailing: 20)
        
        contentView.addSubview(expenseView)
        
        expenseView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            expenseView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            expenseView.topAnchor.constraint(equalTo: incomeView.bottomAnchor, constant: 15),
            expenseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            expenseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
    
    private func setupDetailView() {
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .gray
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        
        let titleLabel = UILabel()
        titleLabel.text = "ランチ"
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        let subtitleLabel = UILabel()
        titleLabel.text = "食費・レストラン"
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = .lightGray
        
        let detailLabelView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        detailLabelView.axis = .vertical
        detailLabelView.alignment = .leading
        detailLabelView.spacing = 2
        
        let amountLabel = UILabel()
        amountLabel.text = "-¥ 1000"
        amountLabel.font = .systemFont(ofSize: 20)
        
        DetailView.addArrangedSubview(imageView)
        DetailView.addArrangedSubview(detailLabelView)
        DetailView.addArrangedSubview(amountLabel)
        
        DetailView.backgroundColor = .white
        DetailView.axis = .horizontal
        DetailView.alignment = .center
        DetailView.distribution = .fill
        DetailView.spacing = 12
        DetailView.isLayoutMarginsRelativeArrangement = true
        DetailView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 20,
                                                                      bottom: 10,
                                                                      trailing: 20)
        
        contentView.addSubview(DetailView)
        
        DetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            DetailView.centerXAnchor.constraint(equalTo: expenseView.centerXAnchor),
            DetailView.topAnchor.constraint(equalTo: expenseView.bottomAnchor),
            DetailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            DetailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            DetailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
}
