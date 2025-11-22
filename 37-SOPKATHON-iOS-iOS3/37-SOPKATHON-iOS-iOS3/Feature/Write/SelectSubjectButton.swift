//
//  SelectSubjectButton.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

enum ButtonType {
    case normal
    case selected
    
    var titleColor: UIColor {
        switch self {
        case .normal:
            return .grey400
        case .selected:
            return .grey800
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .normal:
            return .grey100
        case .selected:
            return .primary
        }
    }
    
    var borderColor: CGColor {
        switch self {
        case .normal:
            return UIColor.grey300.cgColor
        case .selected:
            return UIColor.clear.cgColor
        }
    }
    
    var borderWidth: Int {
        switch self {
        case .normal:
            return 2
        case .selected:
            return 0
        }
    }
}

final class SelectSubjectButton: BaseView {
    private let title = UILabel()
    private var type: ButtonType = .normal
    
    init(title: String) {
        super.init(frame: .zero)
        self.title.text = title
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(title)
    }
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = type.backgroundColor
            $0.layer.borderColor = type.borderColor
            $0.layer.borderWidth = CGFloat(type.borderWidth)
            $0.layer.cornerRadius = 15
        }
        
        title.do {
            $0.font = .pretendard(.head_b_20)
            $0.textColor = type.titleColor
        }
    }
    
    override func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(66)
        }
        
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension SelectSubjectButton {
    func toggleType() {
        self.type = self.type == .normal ? .selected : .normal
        updateUI(type: self.type)
    }
    
    private func updateUI(type: ButtonType) {
        self.do {
            $0.backgroundColor = type.backgroundColor
            $0.layer.borderColor = type.borderColor
            $0.layer.borderWidth = CGFloat(type.borderWidth)
        }
        
        title.do {
            $0.textColor = type.titleColor
        }
    }
}
