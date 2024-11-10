//
//  PurchaseSheetController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/10/24.
//

import UIKit
import Then

class PurchaseSheetController: UIViewController {
    
    let purchaseSheet = PurchaseSheetView()
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = purchaseSheet
        
        purchaseSheet.sizeCollectionView.dataSource = self
        purchaseSheet.sizeCollectionView.delegate = self

        purchaseSheet.xmark.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissSheet)))
        
    }
    
    @objc func dismissSheet() {
        dismiss(animated: true, completion: nil)
    }
}

extension PurchaseSheetController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemSizeBtnModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemSizeCollectionViewCell.identifier, for: indexPath) as? ItemSizeCollectionViewCell else { return UICollectionViewCell() }
        
        let list = ItemSizeBtnModel.dummy()
        
        cell.sizeLabel.text = list[indexPath.row].size
        cell.priceLabel.text = list[indexPath.row].price
        
        if let selectedIndexPath = selectedIndexPath, selectedIndexPath.row == indexPath.row {
            cell.clickCount = 1
        }else{
            cell.clickCount = 0
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        collectionView.reloadData()
    }
    
    
}
