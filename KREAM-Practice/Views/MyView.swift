//
//  MyView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/24/24.
//

import UIKit
import SnapKit

class MyView: UIView{
    private lazy var settingButton: UIButton = {
        let button = UIButton(type: .system)
        
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .black
        
        
        let image = UIImage(named: "setting")?.resized(to: CGSize(width: 25, height: 25))
        configuration.image = image
        
        button.configuration = configuration
        return button
    }()
    
    private lazy var cameraButton: UIButton = {
        let button = UIButton(type: .system)
        
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .black
        
        let image = UIImage(named: "camera")?.resized(to: CGSize(width: 25, height: 25))
        configuration.image = image
        
        button.configuration = configuration
        
        return button
    }()
    
    private let profileImage: UIImageView = {
        let image = UIImage(named: "profile")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "지누/iOS 챌린저"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let followerText: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let followingText: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    let profileManageBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 9)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor(named: "myButtonBorder")?.cgColor
        return button
    }()
    
    let profileShareBtn: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 9)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor(named: "myButtonBorder")?.cgColor
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let horizontal1 = UIStackView(arrangedSubviews: [settingButton, cameraButton])
        horizontal1.axis = .horizontal
        horizontal1.distribution = .equalSpacing
        horizontal1.alignment = .fill
        horizontal1.spacing = 0
        horizontal1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontal1)
        
        let horizontal2 = UIStackView(arrangedSubviews: [followerText, followingText])
        horizontal2.axis = .horizontal
        horizontal2.spacing = 8

        
        let vertical1 = UIStackView(arrangedSubviews: [nameLabel, horizontal2])
        vertical1.axis = .vertical
        vertical1.spacing = 6
        vertical1.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontal3 = UIStackView(arrangedSubviews: [profileImage, vertical1])
        horizontal3.axis = .horizontal
        horizontal3.alignment = .center
        horizontal3.spacing = 16
        horizontal3.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontal3)

        let horizontal4 = UIStackView(arrangedSubviews: [profileManageBtn, profileShareBtn])
        horizontal4.axis = .horizontal
        horizontal4.spacing = 14
        horizontal4.distribution = .fillEqually
        horizontal4.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontal4)
        
        horizontal1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(75)
            $0.left.equalToSuperview().offset(32.5)
            $0.right.equalToSuperview().inset(32.5)
        }
        
        horizontal3.snp.makeConstraints{
            $0.top.equalTo(horizontal1.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(32.5)
        }
        
        profileImage.snp.makeConstraints{
            $0.height.equalTo(90)
            $0.width.equalTo(90)
        }
        
        horizontal4.snp.makeConstraints{
            $0.top.equalTo(horizontal3.snp.bottom).offset(26)
            $0.left.equalToSuperview().offset(32.5)
            $0.right.equalToSuperview().inset(32.5)
        }
        
    
    
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
