//
//  EmotionCell.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit
import SnapKit
import Then

final class EmotionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "EmotionCell"
    
    // MARK: - UI Components
    
    private let emotionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 34) // 이모지 크기 설정
        $0.textAlignment = .center
    }
    
    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            contentView.layer.borderColor = isSelected ? UIColor.primary.cgColor : UIColor.clear.cgColor
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        configureCellAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(emotionLabel)
    }
    
    private func setupLayout() {
        emotionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func configureCellAppearance() {
        contentView.layer.borderWidth = 1
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 8
    }
    
    // MARK: - Configuration
    
    func configure(with emotion: EmotionModel) {
        // imageName 속성의 이모지 문자열을 UILabel의 text로 할당
        emotionLabel.text = emotion.emoji
        isSelected = false // 선택 상태 초기화
    }
}
