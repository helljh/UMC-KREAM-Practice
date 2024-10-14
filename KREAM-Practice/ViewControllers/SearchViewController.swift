//
//  SearchViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/9/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()

    override func loadView() {
        //navigationController?.popViewController(animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "navBackImage")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }

}
