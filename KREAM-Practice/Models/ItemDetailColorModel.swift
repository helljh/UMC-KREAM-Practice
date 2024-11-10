//
//  ItemColorModel.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/10/24.
//
import UIKit

struct ItemDetailColorModel{
    let image: UIImage
}

extension ItemDetailColorModel{
    static func dummy() -> [ItemDetailColorModel]{
        [
            ItemDetailColorModel(image: UIImage(named: "MatinKim1.png")!),
            ItemDetailColorModel(image: UIImage(named: "MatinKim2.png")!),
            ItemDetailColorModel(image: UIImage(named: "MatinKim3.png")!),
            ItemDetailColorModel(image: UIImage(named: "MatinKim4.png")!),
            ItemDetailColorModel(image: UIImage(named: "MatinKim5.png")!),
            ItemDetailColorModel(image: UIImage(named: "MatinKim6.png")!),
            ItemDetailColorModel(image: UIImage(named: "MatinKim1.png")!),
        ]
    }
}
