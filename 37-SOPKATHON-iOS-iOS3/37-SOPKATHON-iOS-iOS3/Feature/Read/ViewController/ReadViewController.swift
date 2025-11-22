//
//  ReadViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/23/25.
//

import UIKit
import Then

// EmotionViewDelegate
final class ReadViewController: BaseViewController {
    
    // MARK: - UI Components
    
    // 헤더 영역: 제목 레이블
    private let titleLabel = UILabel().then {
        $0.text = "글을 읽고 당신의 생각을 들려주세요"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        $0.textColor = .label
    }
    
    // 헤더 영역: 닫기 버튼 (X)
    private lazy var closeButton = UIButton().then {
        let image = UIImage(systemName: "xmark")
        $0.setImage(image, for: .normal)
        $0.tintColor = .label
        $0.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    // 글 제목 보여주는 영역: ReadTitleView
    private let readTitleView = ReadTitleView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 글 내용 보여주는 영역: ReadView
    private let readView = ReadView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    // 감정 선택 영역: EmotionView
    private let emotionView = EmotionView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 버튼
    private let actionButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .pretendard(weight: .Medium, size: 14)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .primary
        $0.layer.cornerRadius = 8
    }
    
    // MARK: - Properties
    
    private var selectedEmotion: EmotionModel?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupHierarchy()
        setupLayout()
    }
    
    
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(readTitleView)
        view.addSubview(readView)
        view.addSubview(emotionView)
        view.addSubview(actionButton)
    }
    
    private func setupLayout() {
        
        [titleLabel, closeButton, readTitleView, readView, emotionView, actionButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            // 헤더: 글을 읽고~~ 하드코딩 부분, X 마크
            closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            closeButton.heightAnchor.constraint(equalToConstant: 44),
            
            titleLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: closeButton.leadingAnchor, constant: -10),
            
            // 리드 타이틀 뷰
            readTitleView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 37),
            readTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            readTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            readTitleView.heightAnchor.constraint(equalToConstant: 65), // 높이
            
            // 리드 뷰
            readView.topAnchor.constraint(equalTo: readTitleView.bottomAnchor, constant: 24),
            readView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            readView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            readView.bottomAnchor.constraint(equalTo: emotionView.topAnchor, constant: -30),
            
            // 이모션 뷰
            emotionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emotionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emotionView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20),
            emotionView.heightAnchor.constraint(equalToConstant: 100), // 높이 설정
            
            // 버튼
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - Actions
    
    @objc private func closeButtonTapped() {
        // 모달로 띄웠을 경우:??
        self.dismiss(animated: true, completion: nil)
    }
}
