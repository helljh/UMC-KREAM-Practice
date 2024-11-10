//
//  ItemSizeCollectionViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/10/24.
//

import UIKit
import Then
import SnapKit

class ItemSizeCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemSizeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button = UIView().then{
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "F2F2F2")?.cgColor
        $0.backgroundColor = .white
    }
    
    let sizeLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.textColor = .black
    }
    
    let priceLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = UIColor(named: "D95A5D")
    }
    
    var clickCount: Int = 0{
        didSet{
            if clickCount == 1 {
                sizeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
                priceLabel.font = .systemFont(ofSize: 12, weight: .semibold)
                button.layer.borderColor = UIColor.black.cgColor
            }else{
                sizeLabel.font = .systemFont(ofSize: 14, weight: .light)
                priceLabel.font = .systemFont(ofSize: 12, weight: .light)
                button.layer.borderColor = UIColor(named: "F2F2F2")?.cgColor
            }
        }
    }

    
    private func setUpView() {
        
        addSubview(button)
        
        button.addSubview(sizeLabel)
        button.addSubview(priceLabel)
        
        sizeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(8)
            $0.left.equalToSuperview().offset(50)
        }
        
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(sizeLabel.snp.bottom)
            $0.left.equalToSuperview().offset(32)
        }
        
        button.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
//            $0.width.equalTo(110)
//            $0.height.equalTo(47)
        }
        
    }
}
