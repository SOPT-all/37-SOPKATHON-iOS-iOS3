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
        case enabledNext
        case disabledBack
        case disabledNext
    }
    
    init(style: ButtonStyle) {
        super.init(frame: .zero)
        setupStyle(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle(style: ButtonStyle) {
        
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        switch style {
        case .enabledBack:
            self.backgroundColor = .grey400.withAlphaComponent(0.2)
            self.backgroundColor?.withAlphaComponent(0.2)
            self.setTitleColor(.grey300, for: .normal)
            self.setTitle("이전", for: .normal)
            self.layer.borderColor = UIColor.grey400.cgColor
            self.layer.borderWidth = 1
        case .enabledNext:
            self.backgroundColor = .primary
            self.setTitleColor(.mainBlack, for: .normal)
            self.setTitle("완료", for: .normal)
        case .disabledBack:
            self.backgroundColor = .grey400.withAlphaComponent(0.2)
            self.setTitleColor(.grey400, for: .normal)
            self.setTitle("이전", for: .normal)
            self.layer.borderColor = UIColor.grey400.cgColor
            self.layer.borderWidth = 1
        case .disabledNext:
            self.backgroundColor = .grey300.withAlphaComponent(0.2)
            self.setTitleColor(.grey400, for: .normal)
            self.setTitle("완료", for: .normal)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 160, height: 48)
    }
}
