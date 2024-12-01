//
//  SearchView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/9/24.
//

import UIKit
import Then
import SnapKit

class SearchView: UIView {

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addStack()
        addConponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchTextField = UITextField().then{
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.font = .systemFont(ofSize: 13.5)
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(named: "F5F5F5")
        $0.layer.cornerRadius = 12
        $0.setLeftPaddingPoints(8)
    }
    
    let cancelButton = UIButton().then{
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.setTitleColor(.black, for: .normal)
        
        
    }
    
    let searchRecommendLabel = UILabel().then{
        $0.text = "추천 검색어"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    let searchRecommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.minimumLineSpacing = 12
        $0.minimumInteritemSpacing = 8
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
    }).then{
        $0.isScrollEnabled = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(SearchRecommendCollectionViewCell.self, forCellWithReuseIdentifier: SearchRecommendCollectionViewCell.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var searchStackView = makeStack(axis: .horizontal, spacing: 11)
    
    private func makeStack(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = .fill
        return stackView
    }
    
    private func addStack(){
        [searchTextField, cancelButton].forEach{searchStackView.addArrangedSubview($0)}
    }
    
    private func addConponents(){
        addSubview(searchStackView)
        addSubview(searchRecommendLabel)
        addSubview(searchRecommendCollectionView)
        
    }
    
    private func constraints(){
        
        searchTextField.snp.makeConstraints{
            $0.width.equalTo(306)
            $0.height.equalTo(36)
        }
        
        cancelButton.snp.makeConstraints{
            $0.width.equalTo(25)
        }
        
        searchStackView.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(7)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(22)
        }
        
        searchRecommendLabel.snp.makeConstraints{
            $0.top.equalTo(searchStackView.snp.bottom).offset(41)
            $0.left.equalToSuperview().offset(16)
        }
        
        searchRecommendCollectionView.snp.makeConstraints{
            $0.top.equalTo(searchRecommendLabel.snp.bottom).offset(11)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().inset(30)
            //$0.width.equalTo(332)
            $0.height.equalTo(76)
        }
    }
    
    
    
}
