//
//  MenuCollectionHandler.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/11/24.
//

import UIKit

class MenuCollectionHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeMenu.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.identifier, for: indexPath) as? HomeMenuCollectionViewCell else { return UICollectionViewCell() }
        
        let list = HomeMenu.dummy()
        
        cell.imageButton.setImage(list[indexPath.row].image, for: .normal)
        cell.titleLabel.text = list[indexPath.row].title
        
        return cell
    }
    
}
