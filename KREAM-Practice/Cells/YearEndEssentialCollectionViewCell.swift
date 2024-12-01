//
//  YearEndEssentialCollectionViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/1/24.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class YearEndEssentialCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "YearEndEssentialCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView = UIImageView().then{
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 8
    }
    
    let idLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            imageView.kf.setImage(with: imageURL)
        }
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(idLabel)
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        }
        
        idLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(10)
            $0.left.equalToSuperview().offset(10)
        }
    }
    
    
}
