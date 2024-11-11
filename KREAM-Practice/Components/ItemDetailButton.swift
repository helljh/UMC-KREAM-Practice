//
//  CustomButton.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/11/24.
//

import UIKit

class ItemDetailButton: UIView{
    let buttonText = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .white
    }
    
    let buttonLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
    }
    
    let buttonPrice = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .white
    }

    init(buttonTextColor: UIColor, buttonLabelColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        buttonLabel.textColor = buttonLabelColor
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        addSubview(buttonText)
        addSubview(buttonLabel)
        addSubview(buttonPrice)
        
        buttonText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.left.equalToSuperview().offset(10)
        }
        
        buttonPrice.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(buttonText.snp.right).offset(21)
        }
        
        buttonLabel.snp.makeConstraints {
            $0.top.equalTo(buttonPrice.snp.bottom).offset(2)
            $0.left.equalTo(buttonText.snp.right).offset(21)
        }
    }
    
    func configure(text: String, label: String, price: String) {
        buttonText.text = text
        buttonLabel.text = label
        buttonPrice.text = price
    }
}
