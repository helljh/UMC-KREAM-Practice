//
//  SearchViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/9/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    private let recommendSearch: [String] = ["채원 슈프림 후리스", "나이키V2K런", "뉴발란드996", "신상 나이키 콜라보", "허그 FW 패딩", "벨루어 눕시"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 네비게이션 바 숨기기
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 다른 뷰 컨트롤러로 넘어갈 때 네비게이션 바 다시 보이게 하기
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView
        view.backgroundColor = .white
        
        searchView.searchRecommendCollectionView.dataSource = self
        searchView.searchRecommendCollectionView.delegate = self
        
        let textFieldTabGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(textFieldTap))
        
        searchView.searchTextField.addGestureRecognizer(textFieldTabGestureRecognizer)
        searchView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func textFieldTap() {
        let searchDetailVC = SearchDetailViewController()
        
        searchDetailVC.modalPresentationStyle = .fullScreen
        present(searchDetailVC, animated: true, completion: nil)
    }
    
    @objc func cancelButtonTapped(){
        let rootVC = MainViewController()
                
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
        
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchRecommendCollectionViewCell.identifier, for: indexPath) as? SearchRecommendCollectionViewCell else { return UICollectionViewCell() }
        
//        cell.button.setTitle(recommendSearch[indexPath.row], for: .normal)
//        cell.button.titleLabel?.font = .systemFont(ofSize: 11.5)
        cell.textLabel.text = recommendSearch[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 폰트와 뷰에 적용할 패딩 설정
        let font = UIFont.systemFont(ofSize: 14)
        let cellPadding: CGFloat = 12 // 좌우 패딩

        // 텍스트 너비 계산
        let text = recommendSearch[indexPath.item]
        let textWidth = text.size(withAttributes: [NSAttributedString.Key.font: font]).width

        // 셀 너비 계산
        let cellWidth = textWidth + (cellPadding * 2)// 패딩 추가

        return CGSize(width: cellWidth, height: 32) // 높이는 고정 값

    }
}
