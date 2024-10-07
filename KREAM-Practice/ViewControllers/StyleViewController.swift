//
//  StyleViewController.swift
//  KREAM-Practice
//
//  Created by 허준호 on 9/24/24.
//

import UIKit

class StyleViewController: UIViewController {

    private let label = UILabel().then{
        $0.text = "스타일"
        $0.textColor = .label
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLabel()
        // Do any additional setup after loading the view.
    }
    
    private func setupLabel() {
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false // Auto Layout 사용 설정

            // 레이블을 뷰의 중앙에 위치시키기 위한 제약 조건 설정
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor), // 가로 중앙 정렬
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor) // 세로 중앙 정렬
            ])
        }

}
