//
//  EmotionCell.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//


import UIKit
import Then

final class EmotionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "EmotionCell"
    
    // MARK: - UI Components
    
    private let iconImageView = UIImageView().then {
        $0.tintColor = .systemGray
        $0.contentMode = .scaleAspectFit
    }
    
    private let nameLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    // MARK: - Properties
    
    // 셀이 선택되었을 때 변하는 부분
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? .systemBlue.withAlphaComponent(0.1) : .systemBackground
            contentView.layer.borderColor = isSelected ? UIColor.systemBlue.cgColor : UIColor.systemGray5.cgColor
            iconImageView.tintColor = isSelected ? .systemBlue : .systemGray
            nameLabel.textColor = isSelected ? .systemBlue : .darkGray
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        configureCellAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupLayout() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 아이콘 제약 조건
            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            // 레이블 제약 조건
            nameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    private func configureCellAppearance() {
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.backgroundColor = .systemBackground
    }
    
    // MARK: - Configuration
    
    func configure(with emotion: EmotionModel) {
        iconImageView.image = UIImage(systemName: emotion.imageName)
        // 선택 상태 초기화
        isSelected = false
    }
}
