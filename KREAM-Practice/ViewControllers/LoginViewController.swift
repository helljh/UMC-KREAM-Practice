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
        
        self.loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func loginButtonTapped(){
        let viewController = MainViewController()
      
        if let email = loginView.emailTextField.text, !email.isEmpty, let password = loginView.passwordTextField.text, !password.isEmpty{
            let user = User(email: email, password: password)
            userDefaultsModel.setUserInfo(user)
        }
        
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
        
    }

}

