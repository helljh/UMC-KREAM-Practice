//
//  ItemDetailViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/9/24.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    private let itemDetailView = ItemDetailView()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = itemDetailView
        
        itemDetailView.itemColorCollectionView.dataSource = self
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(purchaseSheetModalPop))
        itemDetailView.purchaseBtnView.addGestureRecognizer(tapGestureRecognizer)
        
        setupNavigationBar()
    }
    
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(named: "navBackImage")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector (backTapped))
        
        
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc private func backTapped() {
        // 뒤로가기 버튼 클릭 시의 동작
        navigationController?.popViewController(animated: false)
    }
    
    @objc private func purchaseSheetModalPop(){
        let vc = PurchaseSheetController()
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true)
    }
    
}

extension ItemDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemDetailColorModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemColorCollectionViewCell.identifier, for: indexPath) as? ItemColorCollectionViewCell else { return UICollectionViewCell() }
        
        let list = ItemDetailColorModel.dummy()
        
        cell.colorImage.image = list[indexPath.row].image
        
        return cell
    }
    
    
}
