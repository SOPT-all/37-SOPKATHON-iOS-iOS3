//
//  PagingButton.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by sumin Kong on 11/23/25.
//
import UIKit

import SnapKit
import Then

final class PagingButton: UIButton {
    
    enum ButtonStyle {
        case enabledBack
        case disabledNext
        case clickedComplete
        case complete
        
        
        case receivedBack
        
        case receiveNext
    }
    
    init(style: ButtonStyle) {
        super.init(frame: .zero)
        setupStyle(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStyle(style: ButtonStyle) {
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        switch style {
        case .enabledBack:
            self.backgroundColor = .white
            self.setTitleColor(.grey400, for: .normal)//하나는 클릭될 때 하이라이트로 설정해서.
            self.setTitle("이전", for: .normal)
            self.layer.borderColor = UIColor.grey400.cgColor
            self.layer.borderWidth = 1
        case .disabledNext:
            self.backgroundColor = .grey300
            self.setTitleColor(.grey400, for: .normal)
            self.setTitle("다음", for: .normal)
            self.layer.borderColor = UIColor.grey400.cgColor
            self.layer.borderWidth = 1
            
        case .complete:
            self.backgroundColor = .primary
            self.setTitleColor(.mainBlack, for: .normal)
            self.setTitle("완료", for: .normal)
        case .receivedBack:
            self.backgroundColor = .grey800
            self.setTitleColor(.grey400, for: .normal)
            self.setTitle("이전", for: .normal)
            self.layer.borderColor = UIColor.grey400.cgColor
            self.layer.borderWidth = 1
        case .receiveNext:
            self.backgroundColor = .primary
            self.setTitleColor(.mainBlack, for: .normal)
            self.setTitle("들어볼게요", for: .normal)
            
        case .clickedComplete:
            self.backgroundColor = .subColor2
            self.setTitleColor(.mainBlack, for: .highlighted)
            self.setTitle("완료", for: .normal)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 48)
    }
}
