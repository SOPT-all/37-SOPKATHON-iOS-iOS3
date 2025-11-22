//
//  SaveViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/22/25.
//

import UIKit

import SnapKit
import Then

class SaveViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let saveView = SaveView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = saveView
    }
    
    private func setupTableView() {
        saveView.mainTableView.delegate = self
        saveView.mainTableView.dataSource = self
        saveView.mainTableView.separatorStyle = .none
        saveView.mainTableView.rowHeight = UITableView.automaticDimension
        saveView.mainTableView.estimatedRowHeight = 300
        saveView.mainTableView.register(SaveCell.self, forCellReuseIdentifier: SaveCell.identifier)
    }
    

}


//MARK: UITableVeiwDelegate

extension SaveViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SaveCell.identifier, for: indexPath) as? SaveCell else {
            return UITableViewCell()
        }
        return cell
    }
}


//MARK: UITableViewDataSource

extension SaveViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        158
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // 다음화면으로 이동
           let detailVC = DetailViewController()
//           detailVC.movieData = moviesArray[indexPath.row]
           navigationController?.pushViewController(detailVC, animated: true)
       }
}

#Preview {
    SaveViewController()
}
