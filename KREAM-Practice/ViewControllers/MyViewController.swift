import UIKit

class MyViewController: UIViewController {
    
    private let myView = MyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
        
        // 버튼 클릭 이벤트 연결
        myView.profileManageBtn.addTarget(self, action: #selector(manageBtnTapped), for: .touchUpInside)
        
        myView.nameLabel.text = KeyChainHelper.read(forService: "kakaologin") ?? "지누/iOS 챌린저"
    }
    
    @objc
    private func manageBtnTapped() {
        let profileManageVC = ProfileManageViewController()
        profileManageVC.profileImage = myView.profileImage.image!
        //print("Button tapped!")  // 로그 출력으로 버튼 클릭 확인
        navigationController?.pushViewController(profileManageVC, animated: false)
        
    }
    
}
