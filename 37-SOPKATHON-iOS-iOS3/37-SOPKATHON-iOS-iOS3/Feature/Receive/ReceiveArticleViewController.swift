//
//  ReceiveArticleViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class ReceiveArticleViewController: BaseViewController {
    private let rootView = ReceiveArticleView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    override func setAddTarget() {
        rootView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        rootView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
}

extension ReceiveArticleViewController {
    @objc
    private func backButtonDidTap() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        
        let home = UINavigationController(rootViewController: HomeViewController())
        
        UIView.transition(with: window,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            window.rootViewController = home
        })
    }
    
    @objc
    private func nextButtonDidTap() {
        let viewController = ReadViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
