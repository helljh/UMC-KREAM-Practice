//
//  SavedViewTableViewCell.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/4/24.
//

import UIKit
import Then
import SnapKit

class SavedTableViewCell: UITableViewCell {

    static let identifier: String = "SavedItemCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setView()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.saveItemImageView.image = nil
        self.savedItemName.text = nil
        self.savedItemPrice.text = nil
    }
    
    private lazy var saveItemImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        
    }
    
    private lazy var savedItemName = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var savedItemPrice = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var saveButton = UIButton().then{
        $0.setImage(UIImage(named: "saveButton"), for: .normal)
    }
    
    private func setView(){
        self.addSubview(saveItemImageView)
        self.addSubview(savedItemName)
        self.addSubview(savedItemPrice)
        self.addSubview(saveButton)
    }
    
    private func setConstraints(){
        saveItemImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.height.equalTo(72)
            $0.width.equalTo(72)
        }
        
        savedItemName.snp.makeConstraints{
            $0.top.equalToSuperview().offset(13)
            $0.left.equalTo(saveItemImageView.snp.right).offset(13)
            $0.bottom.equalToSuperview().inset(67)
        }
        
        savedItemPrice.snp.makeConstraints{
            $0.right.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(17)
        }
        
        saveButton.snp.makeConstraints{
            $0.height.equalTo(18)
            $0.width.equalTo(14)
            $0.top.equalToSuperview().offset(18)
            $0.right.equalToSuperview().inset(17)
        }
    }
    
    public func configure(savedItem: SavedItemModel){
        self.saveItemImageView.image = UIImage(named: savedItem.itemImage)
        self.savedItemName.text = savedItem.itemName
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let formattedPrice = formatter.string(from: NSNumber(value: savedItem.price)){
            self.savedItemPrice.text = "\(formattedPrice)원"
        }else{
            self.savedItemPrice.text = "가격 정보 없음"
        }
    }
}
