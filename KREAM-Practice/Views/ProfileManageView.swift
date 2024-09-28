//
//  ProfileManageView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/25/24.
//

import UIKit
import SnapKit
import Then

class ProfileManageView: UIView {
    
    private let profileImage = UIImageView().then{
        let image = UIImage(named: "profile")
        $0.image = image
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 45
        $0.clipsToBounds = true
    }
    
    private let profileInfoLabel = UILabel().then{
        $0.text = "프로필 정보"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    private let userEmailLabel =  UILabel().then{
        $0.text = "유저 이메일"
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let emailTextField = UITextField().then{
        let textField = UITextField()
        $0.text = "example@naver.com"
        $0.borderStyle = .none
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "myButtonBorder")?.cgColor
        $0.setLeftPaddingPoints(16)
        $0.setRightPaddingPoints(16)
    }
    
    var emailModifyButton = UIButton().then{
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.layer.cornerRadius = 6
        $0.layer.borderWidth = 1
    }
    
    private let userPwLabel =  UILabel().then {
        $0.text = "유저 비밀번호"
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let pwTextField = UITextField().then{
        $0.text = "*****************"
        $0.borderStyle = .none
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "myButtonBorder")?.cgColor
        $0.setLeftPaddingPoints(16)
        $0.setRightPaddingPoints(16)
    }
    
    var pwModifyButton = UIButton().then{
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.layer.cornerRadius = 6
        $0.layer.borderWidth = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //addSubview(profileImage)
        
        let profileImageHorizontal = UIStackView(arrangedSubviews: [profileImage])
        profileImageHorizontal.axis = .horizontal
        profileImageHorizontal.distribution = .fillProportionally
        profileImageHorizontal.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageHorizontal)
        
        
        let emailTextFieldHorizontal = UIStackView(arrangedSubviews: [emailTextField, emailModifyButton])
        emailTextFieldHorizontal.axis = .horizontal
        emailTextFieldHorizontal.spacing = 9
        emailTextFieldHorizontal.translatesAutoresizingMaskIntoConstraints = false
    
        let emailTextFieldVertical = UIStackView(arrangedSubviews: [userEmailLabel, emailTextFieldHorizontal])
        emailTextFieldVertical.axis = .vertical
        emailTextFieldVertical.spacing = 4
        emailTextFieldVertical.translatesAutoresizingMaskIntoConstraints = false
        
        let pwTextFieldHorizontal = UIStackView(arrangedSubviews: [pwTextField, pwModifyButton])
        pwTextFieldHorizontal.axis = .horizontal
        pwTextFieldHorizontal.spacing = 9
        pwTextFieldHorizontal.translatesAutoresizingMaskIntoConstraints = false
        
        let pwTextFieldVertical = UIStackView(arrangedSubviews: [userPwLabel, pwTextFieldHorizontal])
        pwTextFieldVertical.axis = .vertical
        pwTextFieldVertical.spacing = 4
        pwTextFieldVertical.translatesAutoresizingMaskIntoConstraints = false
        
        let modifyArea = UIStackView(arrangedSubviews: [profileInfoLabel, emailTextFieldVertical, pwTextFieldVertical])
        modifyArea.axis = .vertical
        modifyArea.spacing = 23
        modifyArea.translatesAutoresizingMaskIntoConstraints = false
        addSubview(modifyArea)
        
        profileImage.snp.makeConstraints{
//            $0.top.equalToSuperview().offset(144)
//            $0.left.equalToSuperview().offset(151)
//            $0.right.equalToSuperview().inset(151)
            $0.height.equalTo(90)
            $0.width.equalTo(90)
        }
        
        profileImageHorizontal.snp.makeConstraints{
            $0.top.equalToSuperview().offset(144)
            $0.centerX.equalToSuperview()
        }
        
        modifyArea.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(27)
            $0.right.equalToSuperview().inset(17)
        }
        
        emailTextField.snp.makeConstraints{
            $0.width.equalTo(282)
            $0.height.equalTo(32)
            
        }
        
        emailModifyButton.snp.makeConstraints{
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        pwTextField.snp.makeConstraints{
            $0.width.equalTo(282)
            $0.height.equalTo(32)
            
        }
        
        pwModifyButton.snp.makeConstraints{
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
