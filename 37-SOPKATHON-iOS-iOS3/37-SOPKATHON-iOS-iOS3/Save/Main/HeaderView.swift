//
//  HeaderView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class SaveHeaderView: UIView {
    
    private let backButton = UIButton()
    private let profileImageView = UIImageView()
    private let titleLabel = UILabel()
    private let headerContainerView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(headerContainerView)
        headerContainerView.addArrangedSubviews(backButton, profileImageView, titleLabel)
        self.backgroundColor = .grey100
    }
    
    private func setStyle() {
        
        headerContainerView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 8
        }
        
        backButton.do {
            $0.setImage(UIImage(resource: .backButton), for: .normal)
            $0.tintColor = .black
        }
        
        profileImageView.do {
            $0.image = UIImage(resource: .my)
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.text = "마이 보관함"
            $0.font = .pretendard(.head_b_20)
            $0.textColor = .black
        }
    }
    
    private func setLayout() {
        
        headerContainerView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-12)
        }
        
        backButton.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.width.equalTo(7)
        }
        
        profileImageView.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-12)
        }
    }
}

