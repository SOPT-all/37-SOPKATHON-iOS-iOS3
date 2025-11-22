//
//  SaveCell.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/22/25.
//

import UIKit
import SnapKit
import Then

class SaveCell: UITableViewCell {

    // MARK: - UI Components

    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let dateLabel = UILabel()
    private let separatorLine = UIView()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup

    private func setStyle() {
        titleLabel.do {
            $0.text = "오늘 뭐하지"
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textColor = .black
            $0.numberOfLines = 1
        }

        contentLabel.do {
            $0.text = "오늘은 뭐 할까?"
            $0.font = .systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .darkGray
            $0.numberOfLines = 2
        }

        dateLabel.do {
            $0.text = "2025.11.22"
            $0.font = .systemFont(ofSize: 12, weight: .regular)
            $0.textColor = .lightGray
        }

    }
    
    private func setUI() {
        [titleLabel, contentLabel, dateLabel, separatorLine].forEach {
            contentView.addSubview($0)
        }
        selectionStyle = .none
        
     }

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(20)
        }

        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(titleLabel)
        }

        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-20)

        }

        separatorLine.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

    // MARK: - Configure

    func configure(title: String, content: String, date: String) {
        titleLabel.text = title
        contentLabel.text = content
        dateLabel.text = date
    }
}
