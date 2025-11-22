//
//  ReadView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit
import SnapKit
import Then

final class ReadView: UIView {
    
    // MARK: - UI Components
    
    let contentTextView = UITextView().then {
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        $0.layer.borderColor = UIColor.grey200.cgColor
        $0.backgroundColor = .white
        $0.isEditable = false
        $0.isSelectable = false
        $0.isScrollEnabled = false
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textContainerInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        $0.textColor = .label
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        self.addSubview(contentTextView)
    }
    
    private func setupLayout() {
        contentTextView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Public Methods
    
    func configure(with text: String) {
        contentTextView.text = text
    }
}
