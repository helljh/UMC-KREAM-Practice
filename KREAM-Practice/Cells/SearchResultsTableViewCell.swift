//
//  SearchResultsTableViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/22/24.
//

import UIKit
import SnapKit
import Then
class SearchResultsTableViewCell: UITableViewCell {
    static let identifier: String = "SearchResultsTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addComponents()
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.title.text = nil
    }
    
    let title = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .black
    }
    
    private func addComponents(){
        addSubview(title)
    }
    
    private func constraints(){
        title.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
    }
    
    public func configure(text: String){
        self.title.text = text
    }
    
}
