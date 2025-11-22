//
//  WriteView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class FreeSubjectWriteView: BaseView {
    private let progressImage = UIImageView()
    private let titleLabel = UILabel()
    
    let titleTextField = CustomTextField(type: .title)
    let textTextField = CustomTextField(type: .text)
    
    private let buttonStackView = UIStackView()
    
    private let backButton = PagingButton(style: .enabledBack)
    private let completeButton = PagingButton(style: .complete)
    
    
    override func setUI() {
        addSubviews(
            progressImage,
            titleLabel,
            titleTextField,
            textTextField,
            buttonStackView
        )
        buttonStackView.addArrangedSubviews(backButton, completeButton)
    }
    
    override func setStyle() {
        backgroundColor = .white
        
        progressImage.do {
            $0.image = .progress2
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.font = .pretendard(.head_b_22)
            $0.text = "자유 주제를 작성해주세요"
        }
    }
    
    override func setLayout() {
        progressImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(43)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(progressImage.snp.bottom).offset(42)
            $0.leading.equalToSuperview().inset(23)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        textTextField.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(40)
        }
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}
