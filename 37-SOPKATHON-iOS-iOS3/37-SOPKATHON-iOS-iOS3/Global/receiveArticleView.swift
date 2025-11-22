//
//  receiveArticleView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by sumin Kong on 11/22/25.
//

import UIKit

import SnapKit
import Then

class ReceiveArticleView: BaseView {
    
    // MARK: - UI
    private let announceLabel = UILabel()
    private let elfImageView = UIImageView()
    private let echoImageView = UIImageView()
    private let textBubbleView = UIImageView()
    private let buttonStackView = UIStackView()
    
    private let backButton = PagingButton(style: .receivedBack)
    private let nextButton = PagingButton(style: .receiveNext)
    
    // MARK: - SetUI
    override func setUI() {
        
        addSubviews(
            announceLabel,
            echoImageView,
            elfImageView,
            textBubbleView,
            buttonStackView
        )
        
        buttonStackView.addArrangedSubviews(backButton, nextButton)
    }
    
    // MARK: - SetStyle
    override func setStyle() {
        backgroundColor = .mainBlack
        
        elfImageView.do {
            $0.image = UIImage(named: "receive_img_elfi")
            $0.contentMode = .scaleAspectFit
        }
        
        echoImageView.do {
            $0.image = UIImage(named: "echo")
            $0.contentMode = .scaleAspectFit
        }
        let fullText = "이나님 이 작성한 글 잘 받았습니다.\n다른 사람의 메아리도 들어볼래요?"
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.white,
            range: NSRange(fullText.startIndex..<fullText.endIndex, in: fullText))
        
        if let range = fullText.range(of: "이나님") {
            let nsRange = NSRange(range, in: fullText)
            attributedString.addAttribute(
                .foregroundColor,
                value: UIColor.primary,
                range: nsRange)
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20, weight: .bold), range: nsRange)
        }
        announceLabel.attributedText = attributedString
        announceLabel.textAlignment = .center
        announceLabel.numberOfLines = 0
        textBubbleView.do {
            $0.image = UIImage(named: "bubble")
            $0.contentMode = .scaleAspectFit
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.distribution = .fillEqually
        }
        
    }
    
    // MARK: - Layout
    override func setLayout() {
        announceLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(156)
        }
        echoImageView.snp.makeConstraints {
            $0.top.equalTo(announceLabel.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(236)
            $0.height.equalTo(240)
            
        }
        
        elfImageView.snp.makeConstraints {
            $0.top.equalTo(echoImageView.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().offset(-44)
        }
        
        textBubbleView.snp.makeConstraints {
            $0.top.equalTo(echoImageView.snp.bottom).offset(53)
            $0.leading.equalToSuperview().offset(54)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}

#Preview {
    ReceiveArticleView()
}
