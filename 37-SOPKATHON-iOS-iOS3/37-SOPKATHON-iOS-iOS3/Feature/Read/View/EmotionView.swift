//
//  EmotionView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit
import SnapKit
import Then

protocol EmotionViewDelegate: AnyObject {
    func emotionView(_ emotionView: EmotionView, didSelect emotion: EmotionModel)
}

final class EmotionView: UICollectionView {
    
    weak var emotionViewDelegate: EmotionViewDelegate?
    
    // MARK: - Properties
    
    var emotionData: [EmotionModel] = EmotionModel.dummyData {
        didSet {
            reloadData() // 데이터가 설정되면 컬렉션 뷰를 새로고침
        }
    }
    
    // 현재 선택된 항목의 IndexPath
    private var selectedIndexPath: IndexPath?
    
    // MARK: - Initialization
    
    init() {
        let layout = EmotionView.createLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(EmotionCell.self, forCellWithReuseIdentifier: EmotionCell.reuseIdentifier)
            $0.backgroundColor = .grey100
            $0.layer.borderColor = UIColor.grey200.cgColor
            $0.layer.borderWidth = 1.0
            $0.layer.cornerRadius = 25
            $0.clipsToBounds = true
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Configuration
    
    private static func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 10
            $0.minimumLineSpacing = 10
        }
        return layout
    }
}

// MARK: - UICollectionViewDataSource

extension EmotionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emotionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmotionCell.reuseIdentifier, for: indexPath) as? EmotionCell else {
            return UICollectionViewCell()
        }
        
        let emotion = emotionData[indexPath.item]
        cell.configure(with: emotion)
        
        cell.isSelected = (indexPath == selectedIndexPath)
        
        return cell
    }
}


extension EmotionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 크기를 44 x 44로 고정
        let width: CGFloat = 44
        let height: CGFloat = 44
        
        return CGSize(width: width, height: height)
    }

    // 가운데 정렬
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        let cellCount: CGFloat = 5
        let cellWidth: CGFloat = 44
        let itemSpacing: CGFloat = layout.minimumInteritemSpacing
        
        let totalCellsWidth = (cellWidth * cellCount)
        let totalSpacingWidth = (itemSpacing * (cellCount - 1))
        let totalItemsWidth = totalCellsWidth + totalSpacingWidth
        
        let remainingSpace = collectionView.frame.width - totalItemsWidth
        
        let sideInset = max(0, remainingSpace / 2.0)
        
        let topInset: CGFloat = 10
        let bottomInset: CGFloat = 10
        
        return UIEdgeInsets(top: topInset, left: sideInset, bottom: bottomInset, right: sideInset)
    }
}
