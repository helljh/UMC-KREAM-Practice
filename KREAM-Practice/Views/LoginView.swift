//
//  LoginView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/23/24.
//

import UIKit

class LoginView: UIView {
    
    let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) kream@kream.co.kr"
        textField.borderStyle = .none
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "loginTextFieldBorder")?.cgColor
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(16)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.textColor = UIColor(named: "placeholder")
        textField.borderStyle = .none
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "loginTextFieldBorder")?.cgColor
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(16)
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.title = "로그인"
        configuration.titleAlignment = .center
        configuration.baseBackgroundColor = UIColor(named: "loginButton")
        configuration.baseForegroundColor = .white
        button.configuration = configuration
        button.layer.cornerRadius = 8

        return button
    }()
    
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton()
        
        // 첫 번째 이미지 설정 (왼쪽)
        let leftImage = UIImage(named: "kakaoLogo")
        let leftImageView = UIImageView(image: leftImage)
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // 두 번째 이미지 설정 (오른쪽)
        let rightImage = UIImage(named: "kakaoLogo") // 두 번째 이미지
        let rightImageView = UIImageView(image: rightImage)
        rightImageView.contentMode = .scaleAspectFit
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.isHidden = true
        
        var configuration = UIButton.Configuration.plain()
      
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: AttributeContainer([
                    .font: UIFont.systemFont(ofSize: 16, weight: .bold), // 폰트 크기와 굵기 설정
                    .foregroundColor: UIColor.black // 텍스트 색상 설정
                ]))
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = .black
        configuration.baseBackgroundColor = .white
        
        button.configuration = configuration
        
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(named: "oauthTextFieldBorder")?.cgColor
        button.layer.borderWidth = 1
        
        // 버튼에 두 개의 이미지 추가
        button.addSubview(leftImageView)
        button.addSubview(rightImageView)
        
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            leftImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 17),
            leftImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: 15),  // 이미지 너비
            leftImageView.heightAnchor.constraint(equalToConstant: 15), // 이미지 높이
            
            rightImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -17),
            rightImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            rightImageView.widthAnchor.constraint(equalToConstant: 15),  // 이미지 너비
            rightImageView.heightAnchor.constraint(equalToConstant: 15)  // 이미지 높이
        ])
        
        return button
    }()
    
    let appleLoginButton: UIButton = {
        let button = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        // 첫 번째 이미지 설정 (왼쪽)
        let leftImage = UIImage(named: "appleLogo")
        let leftImageView = UIImageView(image: leftImage)
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // 두 번째 이미지 설정 (오른쪽)
        let rightImage = UIImage(named: "appleLogo") // 두 번째 이미지
        let rightImageView = UIImageView(image: rightImage)
        rightImageView.contentMode = .scaleAspectFit
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.isHidden = true
        
        configuration.attributedTitle = AttributedString("Apple로 로그인", attributes: AttributeContainer([
                    .font: UIFont.systemFont(ofSize: 16, weight: .bold), // 폰트 크기와 굵기 설정
                    .foregroundColor: UIColor.black // 텍스트 색상 설정
                ]))
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = .black
        configuration.baseBackgroundColor = .white
        
        button.configuration = configuration
        button.addSubview(leftImageView)
        button.addSubview(rightImageView)
        
        NSLayoutConstraint.activate([
            leftImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 17),
            leftImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            leftImageView.widthAnchor.constraint(equalToConstant: 15),  // 이미지 너비
            leftImageView.heightAnchor.constraint(equalToConstant: 15), // 이미지 높이
            
            rightImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -17),
            rightImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            rightImageView.widthAnchor.constraint(equalToConstant: 15),  // 이미지 너비
            rightImageView.heightAnchor.constraint(equalToConstant: 15)  // 이미지 높이
        ])
        
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(named: "oauthTextFieldBorder")?.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoView)
        
        let loginStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        loginStackView.axis = .vertical
        loginStackView.spacing = 17
        loginStackView.backgroundColor = .none
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loginStackView)
        
        let oauthLoginStackView = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton])
        oauthLoginStackView.axis = .vertical
        oauthLoginStackView.spacing = 22
        oauthLoginStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(oauthLoginStackView)
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: 126),
            logoView.leftAnchor.constraint(equalTo: leftAnchor, constant: 53),
            logoView.rightAnchor.constraint(equalTo: rightAnchor, constant: -53),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            loginStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 87),
            loginStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 45),
            loginStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            oauthLoginStackView.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 87),
            oauthLoginStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 47.5),
            oauthLoginStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -47.5),
        ])
        
        
        
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
