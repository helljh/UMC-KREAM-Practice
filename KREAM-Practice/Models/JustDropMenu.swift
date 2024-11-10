//
//  JustDropMenu.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/1/24.
//

import UIKit

struct JustDropMenu{
    let image: UIImage
    let brand: String
    let name: String
    var price: Int
    var tradeAmount: Double
    let bgColor: UIColor
}

extension JustDropMenu{
    static func dummy() -> [JustDropMenu] {
        [
            JustDropMenu(image: .matinKim, brand: "Matin Kim", name: "Matin Kim Logo Coating Jumper", price: 228000, tradeAmount: 9.7, bgColor: UIColor(named: "F5F5F5")!),
            JustDropMenu(image: .MLB, brand: "MLB", name: "청키라이너 뉴욕양키스", price: 139000, tradeAmount: 12.8, bgColor: UIColor(named: "blueBg")!),
            JustDropMenu(image: .JORDAN, brand: "JORDAN", name: "Jordan 1 Retro High OG\nYellow Ochre", price: 228000, tradeAmount: 15.6, bgColor: UIColor(named: "redBg")!),
            JustDropMenu(image: .humanMade, brand: "Human Made", name: "Human Made x Kaws\nVarsity Jacket #1 Black", price: 2000000, tradeAmount: 5.3,bgColor: UIColor(named: "greyBg")!),
        ]
    }
}
