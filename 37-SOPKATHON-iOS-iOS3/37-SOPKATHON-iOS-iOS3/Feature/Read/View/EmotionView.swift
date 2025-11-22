//
//  EmotionView.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit
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
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
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
            $0.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
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

// MARK: - UICollectionViewDelegateFlowLayout

extension EmotionView: UICollectionViewDelegateFlowLayout {
    
    // 셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        let sectionInsets = layout.sectionInset
        let interitemSpacing = layout.minimumInteritemSpacing
        
        let totalWidth = collectionView.bounds.width
        
        let numberOfItemsPerRow: CGFloat = 5
        
        let totalSpacing = sectionInsets.left + sectionInsets.right + (interitemSpacing * (numberOfItemsPerRow - 1))
        
        let width = floor((totalWidth - totalSpacing) / numberOfItemsPerRow)
        
        let height: CGFloat = 80 // 높이 고정값 80
        
        return CGSize(width: width, height: height)
    }
}
