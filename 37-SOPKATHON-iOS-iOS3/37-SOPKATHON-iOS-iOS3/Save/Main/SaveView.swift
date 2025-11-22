//
//  SaveView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/22/25.
//

import UIKit

import SnapKit
import Then

final class SaveView: UIView {
    
    let headerView = SaveHeaderView()
    let mainTableView = UITableView(frame: .zero, style: .plain)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(headerView, mainTableView)
    }
    
    private func setStyle() {
        backgroundColor = .white
        
        mainTableView.do {
            $0.backgroundColor = .white
            $0.separatorStyle = .none
        }
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(135)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}



