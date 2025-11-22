//
//  RecommendSubjectViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class RecommendSubjectWriteViewController: BaseViewController {
    private let rootView = RecommendSubjectWriteView()
    private let service = DefaultWriteDiaryService()
    private var titleText = ""
    
    override func loadView() {
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
        getSubjectTitle()
    }
    
    override func setAddTarget() {
        rootView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        rootView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    private func getSubjectTitle() {
        Task {
            do {
                let result = try await service.getRecommendSubject()
                titleText = result
                rootView.bind(title: result)
            } catch {
                print("error")
            }
        }
    }
}

extension RecommendSubjectWriteViewController {
    @objc
    private func backButtonDidTap() {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc
    private func completeButtonDidTap() {
        Task {
            do {
                let _ = try await service.saveDiary(
                    subject: titleText,
                    subjectType: "SELECT",
                    title: self.rootView.titleTextField.textField?.text ?? "",
                    content: self.rootView.textTextField.textView?.text ?? ""
                )
                
                let viewController = CompleteViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
            } catch {
                print("저장 실패")
            }
        }
    }
}
