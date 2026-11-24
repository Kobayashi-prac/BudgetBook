//
//  DailyCashFlowCell.swift
//  BudgetBook
//
//  Created by swiftUI on 2026/11/11.
//

import UIKit

class DailyCashFlowCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let incomeView = UIStackView()
    private let expenseContainerView = UIStackView()
    private let expenseTitleView = UIStackView()
    private let expenseDetailView = UIStackView()
    
    
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
    }
    
    func configure() {
        setupDetailView()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "今日の家計簿"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11)
        ])

    }
    
    private func setupDateLabel() {
        // Date.formatStyleを使う
        dateLabel.text = "\(Date.now.formatted(.dateTime.month().day().weekday().locale(Locale(identifier: "ja_JP"))))"
        contentView.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            dateLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    // MARK: - incomeView
    
    private func setupIncomeView() {
        let incomeLabel = UILabel()
        incomeLabel.text = "収入"
        incomeLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        // TODO: 外から渡せるようにする
        let amountLabel = UILabel()
        amountLabel.text = "+¥ 1000"
        amountLabel.font = .systemFont(ofSize: 20)
        
        incomeView.addArrangedSubview(incomeLabel)
        incomeView.addArrangedSubview(amountLabel)
        
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
    
    // MARK: - ExpenseView
    
    /// 支出ビューの全体
    private func setupExpenseView() {
        setupExpenseTitleView()
        
        expenseContainerView.addArrangedSubview(expenseTitleView)
        expenseContainerView.addArrangedSubview(makeSeparator())
        expenseContainerView.axis = .vertical
        
        contentView.addSubview(expenseContainerView)
        
        expenseContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            expenseContainerView.topAnchor.constraint(equalTo: incomeView.bottomAnchor, constant: 15),
            expenseContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            expenseContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            expenseContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    /// 区切り線の生成
    private func makeSeparator() -> UIView {
        let border = UIView()
        border.backgroundColor = .separator
        border.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            border.heightAnchor.constraint(equalToConstant: 1)
        ])
        return border
    }
    
    /// 支出ビューのタイトル部分
    private func setupExpenseTitleView () {
        let titleLabel = UILabel()
        titleLabel.text = "支出"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        // TODO: 外から渡せるようにする
        let amountLabel = UILabel()
        amountLabel.text = "-¥ 1000"
        amountLabel.font = .systemFont(ofSize: 20)
        
        expenseTitleView.addArrangedSubview(titleLabel)
        expenseTitleView.addArrangedSubview(amountLabel)
        
        amountLabel.setContentHuggingPriority(.required, for: .horizontal)
        expenseTitleView.backgroundColor = .white
        expenseTitleView.axis = .horizontal
        expenseTitleView.alignment = .center
        expenseTitleView.layer.cornerRadius = 8
        expenseTitleView.distribution = .fill
        expenseTitleView.isLayoutMarginsRelativeArrangement = true
        expenseTitleView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 25,
                                                                          leading: 20,
                                                                          bottom: 25,
                                                                          trailing: 20)
    }
    
    /// 支出ビューの詳細部分
    private func setupDetailView() {
        let imageView = makeDetailImageView()
        let detailLabelView = makeDetailTitleLabelView()
        let amountLabel = makeAmountlabel()
        
        expenseDetailView.addArrangedSubview(imageView)
        expenseDetailView.addArrangedSubview(detailLabelView)
        expenseDetailView.addArrangedSubview(amountLabel)
        
        detailLabelView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        amountLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        amountLabel.setContentCompressionResistancePriority(UILayoutPriority(999), for: .horizontal)
        
        expenseDetailView.backgroundColor = .white
        expenseDetailView.axis = .horizontal
        expenseDetailView.alignment = .center
        expenseDetailView.distribution = .fill
        expenseDetailView.spacing = 12
        expenseDetailView.isLayoutMarginsRelativeArrangement = true
        expenseDetailView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 20,
                                                                      bottom: 10,
                                                                      trailing: 20)
        expenseContainerView.addArrangedSubview(expenseDetailView)
    }
    
    /// アイコン画像ビューの生成
    private func makeDetailImageView() -> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .lightGray
        imageView.tintColor = .black
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 17)
        imageView.contentMode = .center
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return imageView
    }
    
    /// 明細のタイトルビューを生成
    private func makeDetailTitleLabelView() -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.text = "ランチ"
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "食費・レストラン"
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.textColor = .lightGray
        
        let detailLabelView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        detailLabelView.axis = .vertical
        detailLabelView.alignment = .leading
        detailLabelView.spacing = 2
        
        return detailLabelView
    }
    
    /// 金額ラベルの生成
    func makeAmountlabel() -> UILabel {
        let amountLabel = UILabel()
        amountLabel.text = "-¥ 1000"
        amountLabel.font = .systemFont(ofSize: 20)
        return amountLabel
    }
    
}
