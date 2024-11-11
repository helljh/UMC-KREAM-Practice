//
//  ItemDetailView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/10/24.
//

import UIKit
import SnapKit
import Then

class ItemDetailView: UIView {
    
    let imageView = UIImageView().then{
        $0.image = UIImage(named: "MatinKim")
        $0.backgroundColor = UIColor(named: "F5F5F5")
    }
    
    let itemColorCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = .init(width: 53, height: 53)
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 8
    }).then{
        $0.isScrollEnabled = true
        $0.register(ItemColorCollectionViewCell.self, forCellWithReuseIdentifier: ItemColorCollectionViewCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
    }
    
    let buyNowLabel = UILabel().then{
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
    }
    
    let buyNowPrice = UILabel().then{
        $0.text = "22,8000원"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
    }
    
    let name = UILabel().then{
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    let subName = UILabel().then{
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor(named: "9C9C9C")
    }
    
    let divideLine = UIView().then{
        $0.backgroundColor = UIColor(named: "F3F3F3")
    }
    
    let scrapButton = UIButton().then{
        $0.setImage(UIImage(named: "save"), for: .normal)
    }
    
    let scrapCount = UILabel().then{
        $0.text = "2,122"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .black
    }
    
    let purchaseBtnview = ItemDetailButton(buttonTextColor: .white, buttonLabelColor: UIColor(named: "PurchaseBtnLabel")!, backgroundColor: UIColor(named: "PurchaseBtnColor")!)

    
    let sellBtnView = ItemDetailButton(buttonTextColor: .white, buttonLabelColor: UIColor(named: "SellBtnLabel")!, backgroundColor: UIColor(named: "SellBtnColor")!)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setUpView()
        purchaseBtnview.configure(text: "구매", label: "즉시 구매가", price: "34,5000")
        sellBtnView.configure(text: "판매", label: "즉시 판매가", price: "39,6000")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        addSubview(imageView)
        addSubview(itemColorCollectionView)
        
        
        let priceStackView = UIStackView(arrangedSubviews: [buyNowLabel,buyNowPrice])
        priceStackView.axis = .vertical
        priceStackView.spacing = 4
        
        let nameStackView = UIStackView(arrangedSubviews: [name,subName])
        nameStackView.axis = .vertical
        nameStackView.spacing = 6
        
        addSubview(priceStackView)
        addSubview(nameStackView)
        addSubview(divideLine)
        addSubview(scrapButton)
        addSubview(scrapCount)
        
        imageView.snp.makeConstraints{
            $0.height.equalTo(373)
            $0.width.equalTo(374)
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        itemColorCollectionView.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(53)
            
        }
        
        priceStackView.snp.makeConstraints{
            $0.top.equalTo(itemColorCollectionView.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(16)
        }
        
        nameStackView.snp.makeConstraints{
            $0.top.equalTo(priceStackView.snp.bottom).offset(18)
            $0.left.equalToSuperview().offset(16)
        }
        
        divideLine.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.top.equalTo(nameStackView.snp.bottom).offset(54)
            $0.horizontalEdges.equalToSuperview()
        }
        
        scrapButton.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(16)
        }
        
        scrapCount.snp.makeConstraints{
            $0.top.equalTo(scrapButton.snp.bottom)
            $0.left.equalTo(16)
        }
        
        addSubview(purchaseBtnview)
        addSubview(sellBtnView)

        purchaseBtnview.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(8)
            $0.left.equalTo(scrapButton.snp.right).offset(19)
            $0.height.equalTo(49)
            $0.width.equalTo(147)
           
        }
        
        sellBtnView.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(8)
            $0.left.equalTo(purchaseBtnview.snp.right).offset(8)
            $0.height.equalTo(49)
            $0.width.equalTo(147)
        }
    }

}
