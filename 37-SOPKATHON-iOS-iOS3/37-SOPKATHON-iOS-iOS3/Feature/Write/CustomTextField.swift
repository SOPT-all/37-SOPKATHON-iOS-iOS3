//
//  CustomTextField.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

enum TextFieldType {
    case title
    case text
    
    var titleText: String {
        switch self {
        case .title:
            return "제목"
        case .text:
            return "내용"
        }
    }
    
    var textfieldColor: UIColor {
        switch self {
        case .title:
            return .grey100
        case .text:
            return .white
        }
    }
    
    var borderColor: CGColor {
        return UIColor.grey200.cgColor
    }
    
    var height: CGFloat {
        switch self {
        case .title:
            return 44
        case .text:
            return 352
        }
    }
}

final class CustomTextField: BaseView {
    private let title = UILabel()
    private let textFieldContainer = UIView()
    private var textField: UITextField?
    private var textView: UITextView?
    private let type: TextFieldType
    
    init(type: TextFieldType) {
        self.type = type
        super.init(frame: .zero)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(title, textFieldContainer)
        if type == .title {
            textField = UITextField()
            guard let textField = textField else { return }
            textFieldContainer.addSubview(textField)
        } else {
            textView = UITextView()
            guard let textView = textView else { return }
            textFieldContainer.addSubview(textView)
        }
        
    }
    
    override func setStyle() {
        title.do {
            $0.text = type.titleText
            $0.font = .pretendard(.title_sb_16)
            $0.textColor = .grey600
        }
        
        textFieldContainer.do {
            $0.backgroundColor = type.textfieldColor
            $0.layer.cornerRadius = 4
            $0.layer.borderColor = type.borderColor
            $0.layer.borderWidth = 1
        }
        
        if let textField = textField {
            textField.do {
                $0.font = .pretendard(.body_r_14)
            }
        }
        
        if let textView = textView {
            textView.do {
                $0.font = .pretendard(.body_r_14)
            }
        }
        
    }
    
    override func setLayout() {
        title.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        textFieldContainer.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(type.height)
            $0.bottom.equalToSuperview()
        }
        
        if let textField = textField {
            textField.snp.makeConstraints {
                $0.top.bottom.equalToSuperview()
                $0.leading.trailing.equalToSuperview().inset(19)
            }
        }
        
        if let textView = textView {
            textView.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(17)
                $0.leading.trailing.equalToSuperview().inset(19)
            }
        }
    }
}
