//
//  DetailView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/22/25.
//

import UIKit
import SnapKit
import Then

class DetailView: UIView {

    // MARK: - UI Components

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let separatorLine = UIView()
    private let contentTextView = UITextView()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup

    private func setUI() {
        backgroundColor = .white

        addSubview(scrollView)
        scrollView.addSubview(contentView)
        [titleLabel, dateLabel, separatorLine, contentTextView].forEach {
            contentView.addSubview($0)
        }

        titleLabel.do {
            $0.font = .systemFont(ofSize: 24, weight: .bold)
            $0.textColor = .black
            $0.numberOfLines = 0
        }

        dateLabel.do {
            $0.font = .systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .lightGray
        }

        separatorLine.do {
            $0.backgroundColor = .systemGray5
        }

        contentTextView.do {
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            $0.textColor = .darkGray
            $0.isEditable = false
            $0.isScrollEnabled = false
            $0.textContainerInset = .zero
            $0.textContainer.lineFragmentPadding = 0
        }
    }

    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }

        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(titleLabel)
        }

        separatorLine.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(titleLabel)
            $0.height.equalTo(1)
        }

        contentTextView.snp.makeConstraints {
            $0.top.equalTo(separatorLine.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(titleLabel)
            $0.bottom.equalToSuperview().offset(-24)
        }
    }

    // MARK: - Configure

    func configure(title: String, date: String, content: String) {
        titleLabel.text = title
        dateLabel.text = date
        contentTextView.text = content
    }
}
