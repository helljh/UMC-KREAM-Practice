//
//  JustDropCollectionHandler.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/11/24.
//

import UIKit

class JustDropCollectionHandler:NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JustDropMenu.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDropCollectionViewCell.identifier, for: indexPath) as? JustDropCollectionViewCell else { return UICollectionViewCell() }
        
        let list = JustDropMenu.dummy()
        
        
        cell.itemImage.setImage(list[indexPath.row].image, for: .normal)
        cell.itemImage.backgroundColor = list[indexPath.row].bgColor
        cell.tradeAmountLabel.text = "거래 " + String(list[indexPath.row].tradeAmount) + "만"
        cell.brandLabel.text = list[indexPath.row].brand
        cell.nameLabel.text = list[indexPath.row].name
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let formattedPrice = formatter.string(from: NSNumber(value: list[indexPath.row].price)){
            cell.priceLabel.text = "\(formattedPrice)원"
        }else{
            cell.priceLabel.text = "가격 정보 없음"
        }
        
        return cell
    }
    
//    @objc func goToDetailPage(){
//        let vc = ItemDetailViewController()
//        vc.hidesBottomBarWhenPushed = true
//        viewController?.navigationController?.pushViewController(vc, animated: false)
//    }
//    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    

        let vc = ItemDetailViewController()
        vc.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(vc, animated: false)
    }
    
}
