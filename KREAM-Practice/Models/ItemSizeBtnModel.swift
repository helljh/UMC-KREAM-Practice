//
//  ItemSizeBtnModel.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/10/24.
//

import Foundation

struct ItemSizeBtnModel{
    let size: String
    let price: String
}

extension ItemSizeBtnModel{
    static func dummy() -> [ItemSizeBtnModel] {
        [
            ItemSizeBtnModel(size: "S", price: "360,000"),
            ItemSizeBtnModel(size: "M", price: "360,000"),
            ItemSizeBtnModel(size: "L", price: "360,000"),
            ItemSizeBtnModel(size: "XL", price: "360,000"),
            ItemSizeBtnModel(size: "XXL", price: "360,000"),
        ]
    }
}
