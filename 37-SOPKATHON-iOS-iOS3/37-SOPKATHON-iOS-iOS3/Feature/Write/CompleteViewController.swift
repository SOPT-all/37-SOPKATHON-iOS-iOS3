//
//  CompleteViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class CompleteViewController: BaseViewController {
    private let rootView = CompleteView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let viewController = ReceiveArticleViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
}
