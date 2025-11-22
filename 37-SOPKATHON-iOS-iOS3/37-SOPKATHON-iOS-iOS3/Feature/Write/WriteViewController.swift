//
//  WriteViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by 이나연 on 11/23/25.
//

import UIKit

final class WriteViewController: BaseViewController {
    private let rootView = WriteView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
