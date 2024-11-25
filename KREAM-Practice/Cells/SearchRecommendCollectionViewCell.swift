//
//  SearchRecommendCollectionViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/22/24.
//

import UIKit
import SnapKit
import Then

class SearchRecommendCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchRecommendCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    let button = UIButton().then{
//        $0.setTitleColor(.black, for: .normal)
//        $0.layer.cornerRadius = 20
//        $0.layer.borderColor = UIColor(named: "ECECEC")?.cgColor
//        $0.layer.borderWidth = 1
//        $0.clipsToBounds = true
//        $0.isUserInteractionEnabled = false
//        
//        var configuration = UIButton.Configuration.filled()
//        configuration.baseBackgroundColor = UIColor(named: "F5F5F5")
//        configuration.contentInsets = .init(top: 8, leading: 12, bottom: 8, trailing: 12)
//        
//        
//        $0.configuration = configuration
//    }
    
    var textLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 13.5)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    let textContainer = UIView().then{
        $0.backgroundColor = UIColor(named: "F5F5F5")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.layer.borderColor = UIColor(named: "ECECEC")?.cgColor
        $0.layer.borderWidth = 1
        
    }
    
    
    private func addComponents(){
        addSubview(textContainer)
        textContainer.addSubview(textLabel)
    }
    
    private func constraints(){
        textLabel.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.verticalEdges.equalToSuperview().inset(8)
            //$0.horizontalEdges.equalToSuperview()
//            $0.width.equalTo(105)
//            $0.height.equalTo(32)
        }
        
        textContainer.snp.makeConstraints{
            $0.edges.equalToSuperview()
            
        }
    }
    
    
}
