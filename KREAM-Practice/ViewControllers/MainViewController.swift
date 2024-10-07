//
//  MainViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/24/24.
//

import UIKit

class MainViewController: UITabBarController {
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myVC = UINavigationController(rootViewController: MyViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
//        self.setValue(CustomTabBar(), forKey: "tabBar")
//        
//        if #available(iOS 13.0, *) {
//            let tabBarAppearance = UITabBarAppearance()
//            tabBarAppearance.backgroundColor = .red // 배경색 설정
//
//            tabBar.standardAppearance = tabBarAppearance
//            if #available(iOS 15.0, *) {
//                tabBar.scrollEdgeAppearance = tabBarAppearance
//            }
//        } else {
//            tabBar.barTintColor = .red // 이전 iOS 버전용
//            tabBar.backgroundImage = UIImage(named: "profile")
//        }
        
        self.tabBar.tintColor = .black
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "home"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "style"), tag: 0)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "shop"), tag: 0)
        savedVC.tabBarItem = UITabBarItem(title: "SAVE", image: UIImage(named: "save"), tag: 0)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "my")?.withRenderingMode(.alwaysOriginal), tag: 0)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
    }
    
}

class CustomTabBar: UITabBar {
    private var customHeight: CGFloat = 100 // 원하는 높이 지정

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        if customHeight > 0 {
            sizeThatFits.height = customHeight
        }
        return sizeThatFits
    }
}
