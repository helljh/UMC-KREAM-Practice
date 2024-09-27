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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        // Custom Back Button
        let backButton = UIBarButtonItem(image: UIImage(named: "navBackImage")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "프로필 관리"
    }
    
    @objc private func backTapped() {
        // 뒤로가기 버튼 클릭 시의 동작
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func emailModifyTapped() {
        isEmailModifyButtonTapped = !isEmailModifyButtonTapped
        let title = isEmailModifyButtonTapped ? "확인" : "변경"
        profileManageView.emailModifyButton.setTitle(title, for: .normal)
        
    }
    
    @objc private func pwModifyTapped() {
        isPwModifyButtonTapped = !isPwModifyButtonTapped
        let title = isPwModifyButtonTapped ? "확인" : "변경"
        profileManageView.pwModifyButton.setTitle(title, for: .normal)
    }
}

