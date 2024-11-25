//
//  SearchDetailViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/22/24.
//

import UIKit
import Moya

class SearchDetailViewController: UIViewController{
    private let searchDetailView = SearchDetailView()
    private let provider = MoyaProvider<SearchTargetType>()
    var results: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchDetailView
        view.backgroundColor = .white
        
        searchDetailView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        searchDetailView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        searchDetailView.searchResultsTableView.dataSource = self
        searchDetailView.searchTextField.delegate = self

    }
    
    @objc private func cancelButtonTapped() {
        let rootVC = MainViewController()
                
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    @objc private func backButtonTapped() {
        let rootVC = SearchViewController()
                
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    private func getSearchResult(text: String){
        provider.request(.getAllResults(query: text)) { result in
            switch result{
            case .success(let response):
                do{
                    // 서버 응답 디코딩
                    let searchResponse = try response.map(SearchResponseModel.self)

                    // 기존 결과 초기화 후 새 데이터 추가
                    self.results = searchResponse.products.map { $0.title }

                    // 테이블 뷰 갱신 (메인 스레드에서)
                    DispatchQueue.main.async {
                        self.searchDetailView.searchResultsTableView.reloadData()
                    }
                    
                }catch{
                    print("Mapping error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
            }
        }
    }


}

extension SearchDetailViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultsTableViewCell.identifier, for: indexPath) as? SearchResultsTableViewCell else { return UITableViewCell() }
        
        cell.configure(text: results[indexPath.row])
        
        return cell
    }
    
    
}

extension SearchDetailViewController: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, text.isEmpty == false{
            
            getSearchResult(text: text)
            // 키보드 숨기기
            textField.resignFirstResponder()
            return true
        }
        
        return false
    }
}
