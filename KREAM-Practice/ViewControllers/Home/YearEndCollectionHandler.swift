//
//  YearEndCollectionHandler.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/11/24.
//

import UIKit

class YearEndCollectionHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return YearEndEssentialModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YearEndEssentialCollectionViewCell.identifier, for: indexPath) as? YearEndEssentialCollectionViewCell else { return UICollectionViewCell() }
        
        let list = YearEndEssentialModel.dummy()
        
        cell.loadImage(from: list[indexPath.row].imageURL)
        cell.idLabel.text = list[indexPath.row].id
        
        return cell
    }
    
    
}
