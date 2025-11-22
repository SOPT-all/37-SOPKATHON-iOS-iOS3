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
        getSubjectTitle()
    }
    
    private func getSubjectTitle() {
        Task {
            do {
                let result = try await service.getRecommendSubject()
                rootView.bind(title: result)
            } catch {
                print("error")
            }
        }
    }
}
