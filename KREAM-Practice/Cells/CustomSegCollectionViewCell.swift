//
//  CustomSegCollectionViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/12/24.
//

import UIKit
import Then
import SnapKit

class CustomSegCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CustomSegCollectionViewCell"
    
    var titleLabel = UILabel().then{
        $0.text = ""
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(19)
        }
    }
    
    func setSelected(_ selected: Bool) {
        titleLabel.font = selected ? .boldSystemFont(ofSize: 16) : .systemFont(ofSize: 16)
    }
}
