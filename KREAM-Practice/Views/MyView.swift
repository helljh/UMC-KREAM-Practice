//
//  MyView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/24/24.
//

import UIKit
import SnapKit
import Then

class MyView: UIView{
    private lazy var settingButton = UIButton().then{
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .black
    
        let image = UIImage(named: "setting")?.resized(to: CGSize(width: 25, height: 25))
        configuration.image = image
        
        $0.configuration = configuration
    }
    
    private lazy var cameraButton = UIButton().then{
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .black
        
        let image = UIImage(named: "camera")?.resized(to: CGSize(width: 25, height: 25))
        configuration.image = image
        
        $0.configuration = configuration
    }
    
    private let profileImage = UIImageView().then{
        let image = UIImage(named: "profile")
        $0.image = image
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 45
        $0.clipsToBounds = true
    }
    
    private let nameLabel = UILabel().then{
        $0.text = "지누/iOS 챌린저"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    
    private let followerText = UILabel().then{
        $0.text = "팔로워 326"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
    }
    
    private let followingText = UILabel().then{
        $0.text = "팔로잉 20"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
    }
    
    let profileManageBtn = UIButton().then{
        $0.setTitle("프로필 관리", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 9)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 0.8
        $0.layer.borderColor = UIColor(named: "myButtonBorder")?.cgColor
    }
    
    let profileShareBtn = UIButton().then{
        $0.setTitle("프로필 공유", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 9)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 0.8
        $0.layer.borderColor = UIColor(named: "myButtonBorder")?.cgColor
    }

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
