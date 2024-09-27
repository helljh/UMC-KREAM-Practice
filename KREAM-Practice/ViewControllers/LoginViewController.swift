//
//  ViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/23/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginView: LoginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        self.view.backgroundColor = .white
        
        self.loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

    }
    
    @objc
    private func loginButtonTapped(){
        let viewController = MainViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    


}

