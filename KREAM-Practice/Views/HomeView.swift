//
//  HomeView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/9/24.
//

import UIKit
import Then
import SnapKit

class HomeView: UIView{
    let searchTextField = UITextField().then{
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.font = .systemFont(ofSize: 13.5)
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(named: "F5F5F5")
        $0.layer.cornerRadius = 12
        $0.setLeftPaddingPoints(8)
    }
    
    let alarmButton = UIButton().then{
        $0.setImage(UIImage(named: "alarm"), for: .normal)
    }
//    var customSeg = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
//        $0.minimumLineSpacing = 0
//        $0.minimumInteritemSpacing = 23
//        $0.scrollDirection = .horizontal
//    }).then{
//        $0.isScrollEnabled = true
//        $0.backgroundColor = .clear
//        $0.register(CustomSegCollectionViewCell.self, forCellWithReuseIdentifier: CustomSegCollectionViewCell.identifier)
//        //$0.translatesAutoresizingMaskIntoConstraints = false
//    }
    var segmentedControl = CustomSegmentedControl(items: ["추천","랭킹","발매정보","럭셔리","남성","여성"])
    
    var underlineView = UIView().then{
        $0.backgroundColor = .black
        //$0.isHidden = true
        //$0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let adArea = UIImageView().then{
        $0.image = UIImage(named: "home_ad")
        $0.contentMode = .scaleAspectFill
    }
    
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.itemSize = CGSize(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9
        $0.minimumLineSpacing = 20
    }).then{
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeMenuCollectionViewCell.self, forCellWithReuseIdentifier: HomeMenuCollectionViewCell.identifier)
    }
    
    let divideLine = UIView().then{
        $0.backgroundColor = UIColor(named: "F2F2F2")
    }
    
    let emptyLabel = UILabel().then{
        $0.text = "빈 화면"
        $0.textColor = .black
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews(){
        addSubview(searchTextField)
        addSubview(alarmButton)
        //addSubview(customSeg)
        addSubview(segmentedControl)
        addSubview(adArea)
        addSubview(menuCollectionView)
        addSubview(divideLine)
        addSubview(emptyLabel)
        addSubview(underlineView)
        
        searchTextField.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).offset(6)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(303)
            $0.height.equalTo(40)
        }
        
        alarmButton.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.top).offset(8)
            $0.left.equalTo(searchTextField.snp.right).offset(15)
            $0.right.equalToSuperview().inset(16)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(25)
            //$0.width.equalTo(325)
            $0.height.equalTo(27)
        }
        
//        customSeg.snp.makeConstraints{
//            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
//            $0.horizontalEdges.equalToSuperview().inset(25)
//            $0.width.equalTo(325)
//            $0.height.equalTo(27)
//        }
        
        adArea.snp.makeConstraints{
            $0.top.equalTo(underlineView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(336)
        }
        
        menuCollectionView.snp.makeConstraints{
            $0.top.equalTo(adArea.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(divideLine.snp.top).inset(30)
        }
        
        divideLine.snp.makeConstraints{
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        emptyLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            
        }
        underlineView.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.left.equalTo(segmentedControl.snp.left)
            $0.height.equalTo(2)
            $0.width.equalTo(segmentedControl.snp.width).dividedBy(segmentedControl.numberOfSegments)
        }
        
//        underlineView.snp.makeConstraints{
//            $0.top.equalTo(segme.snp.bottom)
//            $0.left.equalTo(customSeg.snp.left)
//            $0.height.equalTo(2)
//            
//        }
        
        
    }
    
}
