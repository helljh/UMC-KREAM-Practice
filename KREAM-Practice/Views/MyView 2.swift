//
//  MyView 2.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/24/24.
//


import UIKit
import SnapKit

class MyView: UIView {

    private let settingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "setting"), for: .normal)
        return button
    }()
    
    private let cameraButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "camera"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [leftButton, rightButton])        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing // 두 버튼을 양쪽 끝에 배치
        stackView.alignment = .fill
        stackView.spacing = 0 // 버튼 간의 여백을 없앰
            stackView.translatesAutoresizingMaskIntoConstraints = false
    }

}
