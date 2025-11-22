//
//  SaveViewController.swift
//  37-SOPKATHON-iOS-iOS3
//
//  Created by JIN on 11/22/25.
//

// MARK: - SaveViewController
import UIKit
import SnapKit
import Then

class SaveViewController: BaseViewController {
    
    private let saveView = SaveView()
    private var savedItems: [SavedItem] = []
    
    override func loadView() {
        view = saveView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadDummyData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func setAddTarget() {
        let backButtonImageTap = UITapGestureRecognizer(target: self, action: #selector(backImageDidTap))
        saveView.headerView.backButton.isUserInteractionEnabled = true
        saveView.headerView.backButton.addGestureRecognizer(backButtonImageTap)
        
    }

    @objc
    private func backImageDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupTableView() {
        saveView.mainTableView.delegate = self
        saveView.mainTableView.dataSource = self
        saveView.mainTableView.register(SaveCell.self, forCellReuseIdentifier: SaveCell.identifier)
        saveView.mainTableView.separatorStyle = .none
        saveView.mainTableView.backgroundColor = .white
    }
}

// MARK: - UITableViewDataSource
extension SaveViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SaveCell.identifier,
            for: indexPath
        ) as? SaveCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: savedItems[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SaveViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - Data Models
struct SavedItem {
    let title: String
    let content: String
    let keywords: [String]
    let date: String
    let reactions: [Reaction]
}

struct Reaction {
    let emoji: String
    let count: Int
}

extension SaveViewController {
    
    private func loadDummyData() {
        savedItems = [
            SavedItem(
                title: "제목",
                content: "내용",
                keywords: ["키워드", "키워드", "키워드"],
                date: "2025.01.11",
                reactions: [
                    Reaction(emoji: "👏", count: 2),
                    Reaction(emoji: "❤️", count: 1)
                ]
            )
        ]
        saveView.mainTableView.reloadData()
    }
    
    func getSavedItemData() {
        
    }
}
