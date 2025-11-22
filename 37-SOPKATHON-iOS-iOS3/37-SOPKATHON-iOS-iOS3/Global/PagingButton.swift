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
    
    init(title: String, titleColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: .zero)
        setupStyle(title: title, titleColor: titleColor, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle(title: String, titleColor: UIColor, backgroundColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 173, height: 48)
    }
}
