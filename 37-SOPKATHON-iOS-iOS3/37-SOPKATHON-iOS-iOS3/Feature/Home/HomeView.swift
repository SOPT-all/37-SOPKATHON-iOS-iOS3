//
//  HomeView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/22/25.
//

import UIKit

final class HomeView: BaseView {
    private let titleImageView = UIImageView()
    private let saveStackView = UIStackView()
    private let saveImageView = UIImageView()
    private let saveTitleLabel = UILabel()
    private let dialogueImageView = UIImageView()
    lazy var charcterButton = UIButton()
    
    override func setUI() {
        addSubviews(
            titleImageView,
            saveStackView,
            dialogueImageView,
            charcterButton
        )
        
        saveStackView.addArrangedSubviews(saveImageView, saveTitleLabel)
    }
    
    override func setStyle() {
        saveStackView.do {
            $0.axis = .vertical
            $0.spacing = 2
            $0.backgroundColor = .blue
        }
        
        saveTitleLabel.do {
            $0.text = "보관함"
        }
        
        dialogueImageView.do {
            $0.backgroundColor = .green
        }
        
        charcterButton.do {
            $0.backgroundColor = .red
        }
    }
    
    override func setLayout() {
        titleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(27)
            $0.width.equalTo(96)
            $0.height.equalTo(48)
        }
        
        saveStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(71)
        }
        
        saveImageView.snp.makeConstraints {
            $0.width.height.equalTo(48)
        }
        
        charcterButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(122)
            $0.trailing.equalToSuperview().inset(82)
            $0.height.equalTo(158)
        }
        
        dialogueImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(228)
            $0.leading.equalToSuperview().inset(59)
        }
        
    }
}
