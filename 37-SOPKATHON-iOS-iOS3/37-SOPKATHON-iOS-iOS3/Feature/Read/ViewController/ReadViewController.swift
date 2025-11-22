//
//  ReadViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit
import SnapKit
import Then

final class ReadViewController: BaseViewController {
    
    // MARK: - UI Components
    
    // 헤더 영역: 제목 레이블
    private let titleLabel = UILabel().then {
        $0.text = "글을 읽고 당신의 생각을 들려주세요"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        $0.textColor = .label
    }
    
    // 헤더 영역: 닫기 버튼 (X)
    private let closeButton = UIButton().then {
        let image = UIImage(systemName: "xmark")
        $0.setImage(image, for: .normal)
        $0.tintColor = .label
        //        $0.addTarget(ReadViewController.self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    // ReadTitleView
    private let readTitleView = ReadTitleView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // ReadView
    private let readView = ReadView()
    
    // EmotionView
    private let emotionView = EmotionView()
    
    // 버튼
    private let actionButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .pretendard(weight: .Semibold, size: 16)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .primary
        $0.layer.cornerRadius = 8
        $0.snp.makeConstraints { $0.height.equalTo(48) }
    }
    
    // MARK: - Properties
    
    private var selectedEmotion: EmotionModel?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
        view.backgroundColor = .systemBackground
        
        setupHierarchy()
        setupLayout()
        
        readTitleView.configure(with: "제목")
        readView.configure(with: "어쩌구~~~~~~~~")
    }
    
    private func setupAddTarget() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - BaseViewController Overrides
    
    override func setAddTarget() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
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
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(closeButton)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.lessThanOrEqualTo(closeButton.snp.leading).offset(-10)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(44)
        }
        
        readTitleView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(37)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(43)
        }
        
        readView.snp.makeConstraints {
            $0.top.equalTo(readTitleView.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(emotionView.snp.top).offset(-30)
        }
        
        emotionView.snp.makeConstraints {
            $0.top.equalTo(readView.snp.bottom).offset(0)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(actionButton.snp.top).offset(-68)
            $0.height.equalTo(56)
        }
        
        actionButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
    }
    
    // MARK: - Actions
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true) {
            print("ReadViewController가 닫히고 이전 화면으로 돌아갔습니다.")
        }
        //        let nextVC = MainViewController() // 이동할 ViewController 인스턴스
        //                if let navigationController = self.navigationController {
        //                    navigationController.pushViewController(nextVC, animated: true)
        //                } else {
        //                    // 네비게이션 스택이 없을 경우 모달로 띄우거나 dismiss 후 처리
        //                    self.dismiss(animated: true) {
        //                        // 필요하다면 여기서 윈도우의 rootViewController를 변경하는 로직이 필요할 수 있습니다.
        //                    }
        //                }
    }
}
