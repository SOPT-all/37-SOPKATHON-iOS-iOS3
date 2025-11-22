//
//  ReadViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 한현서 on 11/22/25.
//

import UIKit
import SnapKit
import Then

final class ReadViewController: BaseViewController  {
    
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
    private lazy var actionButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .pretendard(weight: .Semibold, size: 16)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .primary
        $0.layer.cornerRadius = 8
    }
    
    private let service = DefaultRandomDiaryService()
    
    // MARK: - Properties
    
    private var selectedEmotion: EmotionModel?
    private let empathyService = DefaultEmpathyEmotionService()
    private var diaryID: Int = 0
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupHierarchy()
        setupLayout()
        loadRandomDiaryData()
        setAddTarget()
    }
    
    private func loadRandomDiaryData() {
        Task {
            do {
                let diaryData = try await service.getRandomDiary()
                
                await MainActor.run {
                    self.readTitleView.configure(with: diaryData.title)
                    self.readView.configure(with: diaryData.content)
                    self.diaryID = diaryData.id
                }
            } catch {
                print("일기 데이터 로딩 중 에러 발생: \(error)")
            }
        }
    }
    
    

    
    // MARK: - BaseViewController Overrides
    
    override func setAddTarget() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
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
        let homeVC = HomeViewController()
        
        let navigationController = UINavigationController(rootViewController: homeVC)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    
    @objc
    private func actionButtonTapped() {
        print("saving...")
        
        
        fetchDiary()
        
        
    }
    
    private func fetchDiary() {
        Task {
            do {
                let _ = try await empathyService.postEmotion(id: diaryID, emotion: emotionView.emotion)
                print("감정 보내기 성공")
                
                await MainActor.run {
                    let vc = HomeViewController()
                    self.navigationController?.pushViewController(vc,animated: true)
                }
            } catch {
                print("저장 안됨")
            }
        }
    }
    
//    @objc private func postEmotion() async throws {
//        Task {
//            do {
//                let _ = try await empathyService.postEmotion(id: diaryID, emotion: emotionView.emotion) // 받아와야됨... . .
//                print("감정 보내기 성공")
//            } catch {
//                print("저장 안됨")
//            }
//        }
//    }
}
