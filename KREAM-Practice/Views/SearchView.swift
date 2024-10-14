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

    let title = UILabel().then{
        $0.text = "검색 화면"
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView(){
        addSubview(title)
        
        title.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
}
