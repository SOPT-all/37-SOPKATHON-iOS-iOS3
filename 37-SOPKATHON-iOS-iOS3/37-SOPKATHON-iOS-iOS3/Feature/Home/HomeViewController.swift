//
//  HomeViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/22/25.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private let rootView = HomeView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setAddTarget() {
//        rootView.charcterButton.addTarget(self, action: #selector(charcterDidTap), for: .touchUpInside)
    }
}

extension HomeViewController {
    @objc
    private func charcterDidTap() {
        let viewControlelr = SelectViewController()
        self.navigationController?.pushViewController(viewControlelr, animated: true)
    }
}
