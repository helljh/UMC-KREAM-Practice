//
//  PurchaseSheetView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/10/24.
//

import UIKit
import Then
import SnapKit

class PurchaseSheetView: UIView {
    
    let titleLabel = UILabel().then{
        $0.text = "구매하기"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
    }
    
    let unitLabel = UILabel().then{
        $0.text = "(가격 단위: 원)"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(named: "929292")
    }
    
    let xmark = UIButton().then{
        $0.setImage(UIImage(named: "xmark"), for: .normal)
    }
    
    let itemImageView = UIImageView().then{
        $0.image = UIImage(named: "MatinKim")
        $0.backgroundColor = UIColor(named: "F5F5F5")
    }
    
    let name = UILabel().then{
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 14, weight: .regular)
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
    
    let quickShipButton = UIView().then{
        $0.backgroundColor = UIColor(named: "PurchaseBtnColor")
        $0.layer.cornerRadius = 10
    }
    
    let quickShipLabel = UILabel().then{
        $0.text = "빠른배송(1-2일 소요)"
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = UIColor(named: "FFCAB9")
    }
    
    let sizeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = CGSize(width: 110, height: 47)
        $0.scrollDirection = .vertical
        $0.minimumInteritemSpacing = 7
        $0.minimumLineSpacing = 8
    }).then{
        $0.isScrollEnabled = false
        $0.register(ItemSizeCollectionViewCell.self, forCellWithReuseIdentifier: ItemSizeCollectionViewCell.identifier)
        $0.isUserInteractionEnabled = true
        
    }
    
    let purchasePrice = UILabel().then{
        $0.text = "34,5000"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .white
    }
    
    let shipButton = UIView().then{
        $0.backgroundColor = UIColor(named: "NormalShipBtn")
        $0.layer.cornerRadius = 10
        //$0.frame = CGRect(x: 0, y: 0, width: 147, height: 49)
    }
    
    let shipLabel = UILabel().then{
        $0.text = "일반배송(5-7일 소요)"
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = .white
    }
    
    let purchasePrice2 = UILabel().then{
        $0.text = "40,7000"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpView(){
        addSubview(titleLabel)
        addSubview(unitLabel)
        addSubview(xmark)
        addSubview(itemImageView)
        addSubview(name)
        addSubview(subName)
        addSubview(sizeCollectionView)
        addSubview(divideLine)
        addSubview(quickShipButton)
        addSubview(shipButton)
        
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(162)
        }
        
        unitLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.equalToSuperview().offset(158)
        }
        
        xmark.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.right.equalToSuperview().inset(16)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        itemImageView.snp.makeConstraints{
            $0.top.equalTo(unitLabel.snp.bottom).offset(11)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(91)
            $0.height.equalTo(91)
        }
        
        name.snp.makeConstraints{
            $0.top.equalTo(itemImageView.snp.top).offset(18)
            $0.left.equalTo(itemImageView.snp.right).offset(15)
        }
        
        subName.snp.makeConstraints{
            $0.top.equalTo(name.snp.bottom).offset(4)
            $0.left.equalTo(itemImageView.snp.right).offset(15)
            
        }
        
        sizeCollectionView.snp.makeConstraints{
            $0.top.equalTo(itemImageView.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(102)
            
        }
        
        divideLine.snp.makeConstraints{
            $0.top.equalTo(sizeCollectionView.snp.bottom).offset(355)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        
        
        quickShipButton.addSubview(purchasePrice)
        quickShipButton.addSubview(quickShipLabel)
        
        purchasePrice.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.left.equalToSuperview().offset(55)
        }
        
        quickShipLabel.snp.makeConstraints{
            $0.top.equalTo(purchasePrice.snp.bottom)
            $0.left.equalToSuperview().offset(42)
        }
        
        shipButton.addSubview(purchasePrice2)
        shipButton.addSubview(shipLabel)
        
        purchasePrice2.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.left.equalToSuperview().offset(55)
        }
        
        shipLabel.snp.makeConstraints{
            $0.top.equalTo(purchasePrice2.snp.bottom)
            $0.left.equalToSuperview().offset(42)
        }
        
        quickShipButton.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(10)
            //$0.bottom.equalToSuperview().inset(39)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(168)
            $0.height.equalTo(52)
        }
        
        shipButton.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(10)
            //$0.bottom.equalToSuperview().inset(39)
            $0.right.equalToSuperview().inset(16)
            $0.width.equalTo(168)
            $0.height.equalTo(52)
        }
    }
}
