//
//  ReadView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit
import Then

final class ReadView: UIView {
    
    // MARK: - UI Components
    
    let contentTextView = UITextView().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray5.cgColor
        $0.backgroundColor = .systemGray6
        $0.isEditable = false // 사용자가 직접 편집할 수 없도록
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textContainerInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        $0.textColor = .label
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear // 배경색은 ReadViewController에서 관리하도록 clear로 설정
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
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentTextView.topAnchor.constraint(equalTo: self.topAnchor),
            contentTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    func configure(with text: String) {
        contentTextView.text = text
    }
}
