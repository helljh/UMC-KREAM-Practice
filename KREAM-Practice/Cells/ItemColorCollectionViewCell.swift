//
//  ItemColorCollectionViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/10/24.
//

import UIKit
import Then
import SnapKit

class ItemColorCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemColorCollectionViewCell"
    
    var colorImage = UIImageView().then{
        $0.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        addSubview(colorImage)
        
        colorImage.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
