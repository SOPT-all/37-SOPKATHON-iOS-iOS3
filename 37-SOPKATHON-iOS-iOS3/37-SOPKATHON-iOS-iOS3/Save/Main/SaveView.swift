//
//  SaveView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/22/25.
//

import UIKit

import SnapKit
import Then

class SaveView: BaseView {

    let titleLabel = UILabel()
    let titleStackView = UIStackView()
    let saveViewImage = UIImageView()
    let mainTableView = UITableView(frame: .zero, style: .plain)
   
    
    override func setUI() {
        self.addSubviews(mainTableView, titleStackView)
        titleStackView.addArrangedSubviews(titleLabel, saveViewImage)

    }
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "마이 보관함"
        }
        
        titleStackView.do {
            $0.alignment = .center
            $0.spacing = 16
            $0.axis = .horizontal
        }
    }
    
    override func setLayout() {
        mainTableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
        }
        
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(16)
        }
    }
 

}
