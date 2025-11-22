//
//  SelectView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class SelectView: BaseView {
    private let progressImage = UIImageView()
    private let charcterImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    let freeSubject = SelectSubjectButton(title: "자유 주제")
    let recommendSubject = SelectSubjectButton(title: "주제 선택")
    
    override func setUI() {
        addSubviews(
            progressImage,
            charcterImageView,
            titleLabel,
            descriptionLabel,
            freeSubject,
            recommendSubject
        )
    }
    
    override func setStyle() {
        backgroundColor = .white
        
        progressImage.do {
            $0.image = .progress1
            $0.contentMode = .scaleAspectFit
        }
        
        charcterImageView.do {
            $0.image = .elf
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.text = "주제를 선택해주세요."
            $0.font = .pretendard(.head_b_22)
        }
        
        descriptionLabel.do {
            $0.text = "1가지만 선택 가능해요."
            $0.font = .pretendard(.title_sb_14)
            $0.textColor = .grey500
        }
    }
    
    override func setLayout() {
        progressImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(43)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(progressImage.snp.bottom).offset(55)
            $0.leading.equalToSuperview().inset(43)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(43)
        }
        
        charcterImageView.snp.makeConstraints {
            $0.top.equalTo(progressImage.snp.bottom).offset(55)
            $0.trailing.equalToSuperview().inset(36)
            $0.width.equalTo(104)
            $0.height.equalTo(200)
        }
        
        freeSubject.snp.makeConstraints {
            $0.top.equalTo(charcterImageView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        recommendSubject.snp.makeConstraints {
            $0.top.equalTo(freeSubject.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
    }
}
