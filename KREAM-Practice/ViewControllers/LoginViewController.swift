//
//  ViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginView: LoginView = LoginView()
    
    private let userDefaultsModel = UserDefaultsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        self.view.backgroundColor = .white
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        self.loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        self.loginView.emailTextField.addTarget(self, action: #selector(updateLoginButtonState), for: .editingChanged)
        self.loginView.passwordTextField.addTarget(self, action: #selector(updateLoginButtonState), for: .editingChanged)
        
    }
    
    @objc private func loginButtonTapped(){
        let viewController = MainViewController()
        
        if let email = loginView.emailTextField.text, !email.isEmpty, let password = loginView.passwordTextField.text, !password.isEmpty{
            let user = User(email: email, password: password)
            userDefaultsModel.setUserInfo(user)
        }
        
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
    
}



