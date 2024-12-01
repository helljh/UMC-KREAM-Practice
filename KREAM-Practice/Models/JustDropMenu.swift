//
//  JustDropMenu.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/1/24.
//

import UIKit
import Kingfisher

struct JustDropMenu{
    let imageURL: String
    let brand: String
    let name: String
    var price: Int
    var tradeAmount: Double
    let bgColor: UIColor
}

extension JustDropMenu{
    static func dummy() -> [JustDropMenu] {
        [
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyMzA0MTBfMjUy/MDAxNjgxMTAxNjY1NDk0.fkn9D3pI-6p5IpOf8Y7RtX0q8OV2F2IiGQuFNxW2_F8g.qJsWIZF9DgxakelnDy3kudukcX3aojiU4g7LDENN3Asg.JPEG/a_b90ed2b733a645d79c85b66b90753abb.jpg?type=l_webp", brand: "Matin Kim", name: "Matin Kim Logo Coating Jumper", price: 113000, tradeAmount: 9.7, bgColor: UIColor(named: "F5F5F5")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyNDA5MjZfMzUg/MDAxNzI3MzE3MjA1OTk2.aprWGRGdeMcEW7SiUk8blAY5mmeKGpPjALadodGPVWkg._8f9Y12bQURDzAWWzBFDVg7t6B5Q0GLivC4XoR9DgB4g.PNG/a_c062fc9b9304480a84d9d2adfc3657f7.png?type=l_webp"
                         , brand: "MLB", name: "조던 1 x 트래비스 스캇 레트로 로우 OG SP 리버스 올리브", price: 139000, tradeAmount: 12.8, bgColor: UIColor(named: "blueBg")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyMzEyMTlfMjAw/MDAxNzAyOTc4MzI3MzMx.q56lSB3NREMZb6KBS9NsWe7qIapB88jQww-mGaredi4g.RUi-Nfr0KGigOZs2ofS7oI-y2EiUVWOHDOVWbQJQ6dgg.PNG/a_683d4cc72cb149b98d09c08bda2e5c4f.png?type=l_webp", brand: "JORDAN", name: "Jordan 1 Retro High OG\nYellow Ochre", price: 228000, tradeAmount: 15.6, bgColor: UIColor(named: "redBg")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyMzEyMjBfMTE2/MDAxNzAzMDM3NzQzMjQ2.P0HwJLGP9v8Ah3SFqkQ1VOLXVm1uegKoSUyzcmTs8qgg.TDL37DU1koayh-pYEPqkMEp5bgAS-hXQzJQbILSgaE8g.JPEG/a_f11cf5628f844a3690b874658ab4205c.jpg?type=l_webp", brand: "Human Made", name: "Human Made x Kaws\nVarsity Jacket #1 Black", price: 2000000, tradeAmount: 5.3,bgColor: UIColor(named: "greyBg")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyNDExMjVfMTE1/MDAxNzMyNTA0ODMxMDYw.EQhFY03jajCKOp4QzVQyJxTsD7RWHL-XhcPt9hsZWz0g.sJXxONhj0D7bRs82QKBKrC29hX2qZe17fgBFoLDruUcg.PNG/a_68eaf46d40d24f349aba27a7a1109afb.png?type=l_webp", brand: "Jordan", name: "Jordan x Travis Scott Jumpman Jack TR Black and Dark Mocha", price: 389000, tradeAmount: 4.2, bgColor: UIColor(named: "F5F5F5")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyNDA5MjVfMTA3/MDAxNzI3MjMwNzg4OTc3.9RD0EwAQynqoLRChAp_d4HIKhyNuVsV4PPv7v1uBOwkg.tdtG0Pn7Cq-t1Jf-o2nafJNsvDypVIOgD-hg45XzX6og.PNG/a_5ce22b2d2751459d9485bf443715a42a.png?type=l_webp"
                         , brand: "Goal Studio", name: "Goal Studio T1 2024 Uniform Worlds Jacket White (Non Marking Ver.)", price: 280000, tradeAmount: 3.1, bgColor: UIColor(named: "blueBg")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyNDExMjBfMjI3/MDAxNzMyMDk0MzI4NTQ2.KYsJCb3zGRCUUHd1jB6Lq4LepdRv_EiKtNV-RLCXdxEg.l413m5_v3dEnibskLlKxZ5ITHkC5TTq7A-JazVknQ0Mg.PNG/a_7ecbbf92ea5341788e59068e1c279625.png?type=l_webp", brand: "IAB Studio", name: "IAB Studio x Pokemon Unown Hoodie Gray", price: 110000, tradeAmount: 7.5, bgColor: UIColor(named: "redBg")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyNDA4MTZfOTcg/MDAxNzIzNzc2Njg5NDk3.TjMT5aqTJV67x3jl3WyvmbpqVvzeH7s2H99XdFF59_wg.5DkmIpp_516mCwzNc3lBCNtlKdxohytq2EwrZ6ufC-Ig.PNG/a_80de33a1634947a081cf1b09fbc1aca6.png?type=l_webp", brand: "Jordan", name: "Jordan 1 Retro Low OG Mocha", price: 148000, tradeAmount: 5.3,bgColor: UIColor(named: "greyBg")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyNDEwMDRfMTYg/MDAxNzI4MDE5MDQyNjM0.ar1syXN6hgDHb_6W1VyA3ajlq-qmcCvB585EVC_y3qgg.vJ3cMzUlf2y3nUSWowvR8H61ZT0sDCQL8ejqOh2_Fjsg.PNG/a_deef1f9a162a42af9cfb2c1f4830e5a6.png?type=l_webp", brand: "Palace", name: "Palace Pertex Opaque Balaclava Puffa Black - 24FW", price: 972000, tradeAmount: 10.6, bgColor: UIColor(named: "F5F5F5")!),
            JustDropMenu(imageURL: "https://kream-phinf.pstatic.net/MjAyNDExMjhfMjM3/MDAxNzMyNzgzNDE0MTIz.CfAehJa2253yb0__MGvZLEY4WRt3QQyIUQXQlKnU05Ig.qifuMUHOzi6Vc4KCvF32lttuCUczAbE_jRpQANr9F-Eg.PNG/a_c6e2d0ae13d7458ea36e43a2d589298e.png?type=l_webp"
                         , brand: "Porter", name: "Porter All New Tanker Sling Bag Zip L Black", price: 590000, tradeAmount: 13.2, bgColor: UIColor(named: "blueBg")!),
        ]
    }
}
