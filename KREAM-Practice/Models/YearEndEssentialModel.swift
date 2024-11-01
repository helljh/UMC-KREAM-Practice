//
//  Untitled.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/1/24.
//

import UIKit

struct YearEndEssentialModel{
    let image: UIImage
    let id: String
}

extension YearEndEssentialModel {
    static func dummy() -> [YearEndEssentialModel] {
        return [
            YearEndEssentialModel(image: .yearEndEssential1, id: "@katarinabluu"),
            YearEndEssentialModel(image: .yearEndEssential2, id: "@imwinter"),
            YearEndEssentialModel(image: .yearEndEssential3, id: "@thousand_wooo")
            ]
    }
}
