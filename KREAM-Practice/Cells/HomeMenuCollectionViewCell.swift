//
//  HomeCollectionViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/9/24.
//

import UIKit
import Then
import SnapKit

class HomeMenuCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomeMenuCollectionViewCell"
    
    let imageButton = UIButton()
    
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 11.5)
        $0.textColor = .black
      
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        addSubview(imageButton)
        addSubview(titleLabel)
        
        imageButton.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(61)
            $0.width.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
