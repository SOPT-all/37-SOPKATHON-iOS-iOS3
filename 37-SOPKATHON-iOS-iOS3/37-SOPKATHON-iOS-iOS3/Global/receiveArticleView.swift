//
//  receiveArticleView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by sumin Kong on 11/22/25.
//

import UIKit

import SnapKit
import Then

class receiveArticleView: BaseView {
    
    // MARK: - UI
    private let announceLabel = UILabel()
    private let elfImageView = UIImageView()
    private let mearyImageView = UIImageView()
    private let backButton = UIButton(type: .system)
    private let nextButton = UIButton(type: .system)
    private let textBubbleView = UIImageView()//말풍선
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - SetUI
    override func setUI() {
        
        addSubviews(
            announceLabel,
            mearyImageView,
            elfImageView,
            textBubbleView,
            backButton,
            nextButton,
        )
    }
    
    // MARK: - SetStyle
    override func setStyle() {
        elfImageView.do {
            $0.image = UIImage(named: "elf")
            $0.contentMode = .scaleAspectFit
        }
        
        mearyImageView.do {
            $0.image = UIImage(named: "meary")
            $0.contentMode = .scaleAspectFit
        }
        announceLabel.do {
            $0.text = "ㅇㅇ님이 작성한 글 잘 받았습니다.\n다른 사람의 메아리도 들어볼래요?"
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
        textBubbleView.do {
            $0.image = UIImage(named: "textBubble")
            $0.contentMode = .scaleAspectFit
        }
        
        backButton.do {
            $0.setTitle("이전", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .white
            $0.clipsToBounds = true
        }

        nextButton.do {
            $0.setTitle("다음", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .darkGray
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }

        

    }
    
    // MARK: - Layout
    override func setLayout() {
        
        announceLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(115)
        }

        elfImageView.snp.makeConstraints {
            $0.centerY.equalTo(textBubbleView.snp.centerY)
            $0.leading.equalTo(textBubbleView.snp.trailing).offset(-10)
        }

        
        mearyImageView.snp.makeConstraints {
            $0.top.equalTo(announceLabel.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(240)
            $0.height.equalTo(235)

        }
        
        elfImageView.snp.makeConstraints {
            $0.centerY.equalTo(textBubbleView.snp.centerY)
            $0.leading.equalTo(textBubbleView.snp.trailing).offset(-10)
        }
        
        textBubbleView.snp.makeConstraints {
            $0.top.equalTo(mearyImageView.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.bottom.equalToSuperview().offset(-40)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }

        nextButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-40)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }


    }
}

#Preview {
    receiveArticleView()
}
