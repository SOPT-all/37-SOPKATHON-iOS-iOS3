//
//  SelectViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class SelectViewController: BaseViewController {
    private let rootView = SelectView()
    private var type: String = ""
    
    override func loadView() {
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    override func setAddTarget() {
        
        let freeTap = UITapGestureRecognizer(target: self, action: #selector(freeSubjectDidTap))
        rootView.freeSubject.isUserInteractionEnabled = true
        rootView.freeSubject.addGestureRecognizer(freeTap)
        
        let recommendTap = UITapGestureRecognizer(target: self, action: #selector(recommendSubjectDidTap))
        rootView.recommendSubject.isUserInteractionEnabled = true
        rootView.recommendSubject.addGestureRecognizer(recommendTap)
        
        rootView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        rootView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
}

extension SelectViewController {
    @objc
    private func backButtonDidTap() {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc
    private func freeSubjectDidTap() {
        rootView.freeSubject.setSelected(true)
        rootView.recommendSubject.setSelected(false)
        rootView.nextButton.setupStyle(style: .complete)
        type = "FREE"
    }

    @objc
    private func recommendSubjectDidTap() {
        rootView.recommendSubject.setSelected(true)
        rootView.freeSubject.setSelected(false)
        rootView.nextButton.setupStyle(style: .complete)
        type = "SELECT"
    }
    
    @objc
    private func nextButtonDidTap() {
        if type == "FREE" {
            let viewController = FreeSubjectWriteViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            let viewController = RecommendSubjectWriteViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}
