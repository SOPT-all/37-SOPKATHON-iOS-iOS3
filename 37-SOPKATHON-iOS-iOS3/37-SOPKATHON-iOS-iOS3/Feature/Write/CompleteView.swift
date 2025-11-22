//
//  CompleteView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class CompleteView: BaseView {
    private let progressImage = UIImageView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override func setUI() {
        addSubviews(
            progressImage,
            imageView,
            titleLabel,
            descriptionLabel
        )
    }
    
    override func setStyle() {
        backgroundColor = .white
        
        progressImage.do {
            $0.image = .progress3
            $0.contentMode = .scaleAspectFit
        }
        
        imageView.do {
            $0.image = .congrat
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.text = "글 작성이 완료 되었어요!"
            $0.font = .pretendard(.title_sb_20)
            $0.textColor = .black
        }
        
        descriptionLabel.do {
            $0.text = "AI가 키워드를 다른 사람들에게 보내주고 있어요"
            $0.font = .pretendard(.body_r_16)
            $0.textColor = .grey400
        }
    }
    
    override func setLayout() {
        progressImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(43)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(progressImage.snp.bottom).offset(150)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
    }
}

#Preview {
    CompleteView()
}
