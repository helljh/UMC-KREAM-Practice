//
//  ProfileManageViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/25/24.
//

import UIKit

class ProfileManageViewController: UIViewController {
    private lazy var profileManageView = ProfileManageView().then{
        $0.emailModifyButton.addTarget(self, action: #selector(emailModifyTapped), for: .touchUpInside)
        $0.pwModifyButton.addTarget(self, action: #selector(pwModifyTapped), for: .touchUpInside)
    }
    
    private var isEmailModifyButtonTapped: Bool = false
    private var isPwModifyButtonTapped: Bool = false
    
    public var profileImage: UIImage?
    
    private let userDefaultsModel = UserDefaultsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        
        setupNavigationBar()
        
        if let image = profileImage{
            profileManageView.profileImage.image = image
        }
        
        if let user = userDefaultsModel.loadUserInfo(){
            profileManageView.emailTextField.text = user.email
            profileManageView.pwTextField.text = user.password
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupNavigationBar() {
        // Custom Back Button
        let backButton = UIBarButtonItem(image: UIImage(named: "navBackImage")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "프로필 관리"
    }
    
    @objc private func backTapped() {
        // 뒤로가기 버튼 클릭 시의 동작
        navigationController?.popViewController(animated: false)
    }
    
    @objc private func emailModifyTapped() {
        isEmailModifyButtonTapped = !isEmailModifyButtonTapped
        profileManageView.emailTextField.isUserInteractionEnabled = isEmailModifyButtonTapped
        
        let title = isEmailModifyButtonTapped ? "확인" : "변경"
        profileManageView.emailModifyButton.setTitle(title, for: .normal)
        
        if isEmailModifyButtonTapped {
            return
        }
        
        // "확인"을 눌렀을 때 입력된 이메일을 가져와서 기존 이메일과 비교
        if let newEmail = profileManageView.emailTextField.text, !newEmail.isEmpty {
            if let currentUser = userDefaultsModel.loadUserInfo(), newEmail == currentUser.email {
                // 동일한 이메일인 경우 경고 메시지 표시
                let alert = UIAlertController(title: "경고", message: "기존의 이메일과 동일합니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                present(alert, animated: true)
            } else {
                // 이메일이 다르면 업데이트
                userDefaultsModel.updateUserEmail(newEmail)
            }
        }
    }
    
    @objc private func pwModifyTapped() {
        isPwModifyButtonTapped = !isPwModifyButtonTapped
        profileManageView.pwTextField.isUserInteractionEnabled = isPwModifyButtonTapped
        
        let title = isPwModifyButtonTapped ? "확인" : "변경"
        profileManageView.pwModifyButton.setTitle(title, for: .normal)
        
        if isPwModifyButtonTapped {
            return
        }
        
        // "확인"을 눌렀을 때 입력된 비밀번호를 가져와서 기존 비밀번호와 비교
        if let newPassword = profileManageView.pwTextField.text, !newPassword.isEmpty {
            if let currentUser = userDefaultsModel.loadUserInfo(), newPassword == currentUser.password {
                // 동일한 비밀번호인 경우 경고 메시지 표시
                let alert = UIAlertController(title: "경고", message: "기존의 비밀번호와 동일합니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                present(alert, animated: true)
            } else {
                // 비밀번호가 다르면 업데이트
                userDefaultsModel.updateUserPassword(newPassword)
            }
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}


