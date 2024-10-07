//
//  SavedView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/4/24.
//

import UIKit

class SavedView: UIView {

    private lazy var titleLabel = UILabel().then{
        $0.text = "Saved"
        $0.font = .systemFont(ofSize: 28, weight: .bold)
        $0.textColor = .black
    }
    
    public lazy var totalCountLabel = UILabel().then{
        $0.text = "전체 개"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    public lazy var savedTableView = UITableView().then{
        $0.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        $0.separatorStyle = .singleLine
    }
    
    private func setViews(){
        self.addSubview(titleLabel)
        self.addSubview(totalCountLabel)
        self.addSubview(savedTableView)
    }
    
    private func setConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        totalCountLabel.translatesAutoresizingMaskIntoConstraints = false
        savedTableView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            $0.left.equalToSuperview().offset(10)
        }
        
        totalCountLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(13)
        }
        
        savedTableView.snp.makeConstraints{
            $0.top.equalTo(totalCountLabel.snp.bottom).offset(12)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
