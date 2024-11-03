//
//  JustDropCollectionViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/1/24.
//

import UIKit
import Then

class JustDropCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "JustDropCollectionViewCell"
    private var isSavetapped: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageButton = UIButton().then{
        $0.contentMode = .center
    }
    
    
    let brandLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
    }
    
    let nameLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    let priceLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .black
    }
    
    let saveButton = UIButton().then{
        $0.setImage(UIImage(named: "save"), for: .normal)
        $0.addTarget(JustDropCollectionViewCell.self, action: #selector (saveButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func saveButtonTapped(){
        isSavetapped.toggle()
        if(isSavetapped){
            saveButton.setImage(UIImage(named: "save_fill"), for: .normal)
        }else{
            saveButton.setImage(UIImage(named: "save_none"), for: .normal)
        }
    }
    
    let tradeAmountLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.textColor = .black
    }
    
    let buyNowLabel = UILabel().then{
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = UIColor(named: "A2A2A2")
    }
    
    private func setupView(){
        addSubview(imageButton)
        addSubview(brandLabel)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(buyNowLabel)
        
     
        imageButton.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.width.equalTo(142)
        }
        
        imageButton.addSubview(tradeAmountLabel)
        imageButton.addSubview(saveButton)
        
        tradeAmountLabel.snp.makeConstraints{
            $0.top.equalTo(imageButton.snp.top).offset(8)
            $0.right.equalTo(imageButton.snp.right).inset(8)
        }
        
        saveButton.snp.makeConstraints{
            $0.right.equalTo(imageButton.snp.right).inset(10)
            $0.bottom.equalTo(imageButton.snp.bottom).inset(10)
            $0.width.equalTo(22)
            $0.height.equalTo(20)
        }
        
        brandLabel.snp.makeConstraints{
            $0.top.equalTo(imageButton.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(4)
        }
        
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(brandLabel.snp.bottom).offset(3)
            $0.horizontalEdges.equalToSuperview().offset(4)
        }
        
        priceLabel.snp.makeConstraints{
            $0.bottom.equalTo(buyNowLabel.snp.top).inset(2)
            $0.left.equalToSuperview().offset(4)
        }
        
        buyNowLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview().offset(4)
            
        }
        
        
    }
    
}
