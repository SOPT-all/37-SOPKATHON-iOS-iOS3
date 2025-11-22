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
    
    private let bottomDividerView = UIView()
    private let cardContainerView = UIView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let contentLabel = UILabel()
    private let keywordsLabel = UILabel()
    private let reactionStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(cardContainerView)
        cardContainerView.addSubviews(
            titleLabel,
            dateLabel,
            contentLabel,
            keywordsLabel,
            reactionStackView,
            bottomDividerView
        )
    }
    
    private func setStyle() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        cardContainerView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 12
        }
        
        titleLabel.do {
            $0.font = .pretendard(.head_b_14)
            $0.textColor = .black
        }
        
        dateLabel.do {
            $0.font = .pretendard(.body_r_14)
            $0.textColor = .grey400
        }
        
        contentLabel.do {
            $0.font = .pretendard(.body_r_14)
            $0.textColor = .grey400
            $0.numberOfLines = 2
        }
        
        keywordsLabel.do {
            $0.font = .pretendard(.body_r_14)
            $0.textColor = .grey400
            $0.numberOfLines = 2
        }
        
        reactionStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fillProportionally
        }
        
        bottomDividerView.do {
            $0.backgroundColor = .grey300
        }
    }
    
    private func setLayout() {
        cardContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        keywordsLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        reactionStackView.snp.makeConstraints {
            $0.top.equalTo(keywordsLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        bottomDividerView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.bottom.equalToSuperview().offset(-8)
            $0.width.equalToSuperview()
        }
    }
    
    func configure(with item: Diary) {
        titleLabel.text = item.title
        dateLabel.text = item.createdAt
        contentLabel.text = item.content
        keywordsLabel.text = item.tags.map { "\($0)" }.joined(separator: " ")
        
        // 기존 reaction 뷰 제거
        reactionStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // 각 리액션 타입별로 확인하고 추가
        if item.heart > 0 {
            let reactionView = createReactionView(emoji: "❤️", count: item.heart)
            reactionStackView.addArrangedSubview(reactionView)
        }
        
        if item.good > 0 {
            let reactionView = createReactionView(emoji: "👍", count: item.good)
            reactionStackView.addArrangedSubview(reactionView)
        }
        
        if item.tear > 0 {
            let reactionView = createReactionView(emoji: "💧", count: item.tear)
            reactionStackView.addArrangedSubview(reactionView)
        }
        
        if item.clap > 0 {
            let reactionView = createReactionView(emoji: "👏", count: item.clap)
            reactionStackView.addArrangedSubview(reactionView)
        }
        
        if item.fire > 0 {
            let reactionView = createReactionView(emoji: "🔥", count: item.fire)
            reactionStackView.addArrangedSubview(reactionView)
        }
    }
    
    private func createReactionView(emoji: String, count: Int) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(resource: .grey200).cgColor
        containerView.layer.cornerRadius = 16
        
        let label = UILabel()
        label.text = "\(emoji) +\(count)"
        label.font = .pretendard(.body_r_14)
        label.textColor = .grey500
        
        containerView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        return containerView
    }
}
