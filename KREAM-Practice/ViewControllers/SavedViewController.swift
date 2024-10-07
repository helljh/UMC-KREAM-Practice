//
//  SavedViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/24/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    private let data = dummySavedItemsModel.saveItems
    
    private lazy var savedView = SavedView().then{
        $0.savedTableView.dataSource = self
        $0.savedTableView.delegate = self
        $0.totalCountLabel.text = "전체 \(data.count)개"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
        self.view.backgroundColor = .white
    
    }
    
    
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else { return UITableViewCell() }
        
        cell.configure(savedItem: data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
