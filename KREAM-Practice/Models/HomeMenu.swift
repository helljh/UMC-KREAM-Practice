//
//  Untitled.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/9/24.
//

import UIKit

struct HomeMenu{
    let image: UIImage
    let title: String
}

extension HomeMenu{
    static func dummy() -> [HomeMenu] {
        [
            HomeMenu(image: .크림드로우, title: "크림 드로우"),
            HomeMenu(image: .실시간차트, title: "실시간 차트"),
            HomeMenu(image: .남성추천, title: "남성 추천"),
            HomeMenu(image: .여성추천, title: "여성 추천"),
            HomeMenu(image: .색다른추천, title: "색다른 추천"),
            HomeMenu(image: .정가아래, title: "정가 아래"),
            HomeMenu(image: .윤세24AW, title: "윤세 24AW"),
            HomeMenu(image: .올해의베스트, title: "올해의 베스트"),
            HomeMenu(image: .시월베네핏, title: "10월 베네핏"),
            HomeMenu(image: .아크네선물,title: "아크네 선물"),
        ]
    }
}
