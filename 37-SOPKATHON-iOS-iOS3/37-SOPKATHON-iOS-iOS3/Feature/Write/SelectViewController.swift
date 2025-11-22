//
//  SelectViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class SelectViewController: BaseViewController {
    private let rootView = SelectView()
    
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
    }
}

extension SelectViewController {
    @objc
    private func backButtonDidTap() {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc
    private func freeSubjectDidTap() {
        rootView.freeSubject.toggleType()
        rootView.recommendSubject.isUserInteractionEnabled = !rootView.recommendSubject.isUserInteractionEnabled
    }
    
    @objc
    private func recommendSubjectDidTap() {
        rootView.recommendSubject.toggleType()
        rootView.freeSubject.isUserInteractionEnabled = !rootView.freeSubject.isUserInteractionEnabled
    }
}
