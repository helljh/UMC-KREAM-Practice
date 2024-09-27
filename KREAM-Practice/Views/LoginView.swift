//
//  LoginView.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/23/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12) // 라벨 폰트 크기 설정
        label.textColor = .gray // 라벨 색상 설정
        return label
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
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12) // 라벨 폰트 크기 설정
        label.textColor = .gray // 라벨 색상 설정
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.textColor = UIColor(named: "placeholder")
        textField.borderStyle = .none
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "loginTextFieldBorder")?.cgColor
        textField.isSecureTextEntry = true
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
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        emailStackView.axis = .vertical
        emailStackView.spacing = 8
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        passwordStackView.axis = .vertical
        passwordStackView.spacing = 8
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let loginStackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, loginButton])
        loginStackView.axis = .vertical
        loginStackView.distribution = .fill
        loginStackView.spacing = 17
        loginStackView.backgroundColor = .none
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loginStackView)
        
        let oauthLoginStackView = UIStackView(arrangedSubviews: [kakaoLoginButton, appleLoginButton])
        oauthLoginStackView.axis = .vertical
        oauthLoginStackView.spacing = 22
        oauthLoginStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(oauthLoginStackView)
        
        
        logoView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(126)
            $0.left.equalToSuperview().offset(53)
        }
        
        emailTextField.snp.makeConstraints{
            $0.height.equalTo(35)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.height.equalTo(35)
        }
        
        loginButton.snp.makeConstraints{
            $0.height.equalTo(38)
        }
        
        loginStackView.snp.makeConstraints{
            $0.top.equalTo(logoView.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().inset(45)
        }
        
        kakaoLoginButton.snp.makeConstraints{
            $0.height.equalTo(40)
        }
        
        appleLoginButton.snp.makeConstraints{
            $0.height.equalTo(40)
        }
        
        oauthLoginStackView.snp.makeConstraints{
            $0.top.equalTo(loginStackView.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().inset(47.5)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

