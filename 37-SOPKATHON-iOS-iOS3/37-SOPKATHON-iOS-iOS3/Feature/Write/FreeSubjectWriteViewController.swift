//
//  WriteViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class FreeSubjectWriteViewController: BaseViewController {
    private let rootView = FreeSubjectWriteView()
    private let service = DefaultWriteDiaryService()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func setAddTarget() {
        rootView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        rootView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
}

extension FreeSubjectWriteViewController {
    @objc
    private func backButtonDidTap() {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc
    private func completeButtonDidTap() {
        Task {
            do {
                let _ = try await service.saveDiary(
                    subject: "",
                    subjectType: "FREE",
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
