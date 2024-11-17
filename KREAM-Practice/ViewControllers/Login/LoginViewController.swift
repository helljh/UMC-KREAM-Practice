//
//  ViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/23/24.
//

import UIKit
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    private lazy var kakaoLoginHelper = KakaoLoginHelper()
    
    private let loginModel: LoginModel = LoginModel(email: "", password: "");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        self.view.backgroundColor = .white
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        self.loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        self.loginView.emailTextField.addTarget(self, action: #selector(updateLoginButtonState), for: .editingChanged)
        self.loginView.passwordTextField.addTarget(self, action: #selector(updateLoginButtonState), for: .editingChanged)
        
        loginView.kakaoLoginButton.addTarget(self, action: #selector(KakaoLogin), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped(){
        let viewController = MainViewController()
        
        if let email = loginView.emailTextField.text, !email.isEmpty, let password = loginView.passwordTextField.text, !password.isEmpty{
            let user = LoginModel(email: email, password: password)
            loginModel.setEmail(user.email)
            loginModel.setPassword(user.password)
        }
        
        KeyChainHelper.delete(forAccount: "허준호")
        
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
    @objc private func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc private func updateLoginButtonState() {
        let isActive = !(loginView.emailTextField.text?.isEmpty ?? true) &&
        !(loginView.passwordTextField.text?.isEmpty ?? true)
        
        var configuration = loginView.loginButton.configuration ?? UIButton.Configuration.filled()
        configuration.title = "로그인"
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = .white
        configuration.baseBackgroundColor = isActive ? .black : UIColor(named: "D5D5D5") ?? .lightGray
        
        loginView.loginButton.configuration = configuration
    }
    
    @objc private func KakaoLogin() {
        let mainVC = MainViewController()
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                UserApi.shared.me() {(user, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        if let user = user{
                            let name: String = (user.kakaoAccount?.profile?.nickname)!
                            if(KeyChainHelper.create(token: oauthToken!.accessToken, forAccount: name)){
                                mainVC.modalPresentationStyle = .fullScreen
                                self.present(mainVC, animated: true)
                            }
                            
                        }
                        
//                        // 성공 시 동작 구현
//                        if(KeyChainHelper.create(token: oauthToken?.accessToken ?? "", forAccount: user?.kakaoAccount?.profile?.nickname ?? "")){
//                            mainVC.modalPresentationStyle = .fullScreen
//                            self.present(mainVC, animated: true)
//                        }
                    }
                }
                
                
            }
        }

    }
    
}



