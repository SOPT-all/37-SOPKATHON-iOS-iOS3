//
//  HomeView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/22/25.
//

import UIKit

final class HomeView: BaseView {
    private let backgroundView = UIImageView()
    private let titleImageView = UIImageView()
    private let saveStackView = UIStackView()
    private let saveTitleLabel = UILabel()
    private let dialogueImageView = UIImageView()
    let saveImageView = UIImageView()
    let characterImageView = UIImageView()
    
    override func setUI() {
        addSubviews(
            backgroundView,
            titleImageView,
            saveStackView,
            dialogueImageView,
            characterImageView
        )
        
        saveStackView.addArrangedSubviews(saveImageView, saveTitleLabel)
    }
    
    override func setStyle() {
        backgroundView.do {
            $0.image = .imgHome
            $0.contentMode = .scaleAspectFill
        }
        
        titleImageView.do {
            $0.image = .logo
        }
        
        saveStackView.do {
            $0.axis = .vertical
        }
        
        saveImageView.do {
            $0.image = .homeImgEcho
        }
        
        saveTitleLabel.do {
            $0.text = "보관함"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .pretendard(.head_b_14)
        }
        
        dialogueImageView.do {
            $0.image = .homeDialogue
            $0.contentMode = .scaleAspectFit
        }
        
        characterImageView.do {
            $0.image = .elf
            $0.contentMode = .scaleAspectFit
        }
    }
    
    override func setLayout() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(206)
            $0.height.equalTo(84)
        }
        
        saveStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(77)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        saveImageView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(51)
        }
        
        characterImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(83)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(142)
            $0.height.equalTo(274)
        }
        
        dialogueImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(264)
            $0.leading.equalToSuperview().inset(53)
        }
        
    }
}
