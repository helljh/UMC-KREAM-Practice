import UIKit

class MyViewController: UIViewController {
    
    private let myView = MyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
        
        // 버튼 클릭 이벤트 연결
        myView.profileManageBtn.addTarget(self, action: #selector(manageBtnTapped), for: .touchUpInside)
    }
    
    @objc
    private func manageBtnTapped() {
        print("Button tapped!")  // 로그 출력으로 버튼 클릭 확인
        let nextVC = ProfileManageViewController()
        navigationController?.pushViewController(nextVC, animated: false)
        
    }
    
}
