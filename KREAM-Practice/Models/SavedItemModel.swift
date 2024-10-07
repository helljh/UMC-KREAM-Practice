//
//  SavedItemModel.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/4/24.
//

import Foundation

struct SavedItemModel{
    let itemImage: String
    let itemName: String
    var price: Int
}

final class dummySavedItemsModel {
    static let saveItems: [SavedItemModel] = [
        SavedItemModel(itemImage: "나이키 덩크 로우 레트로 블랙.png", itemName: "나이키 덩크 로우 레트로 블랙", price: 89000),
        SavedItemModel(itemImage: "나이키 에어 포스 1 '07 로우 트리플 블랙.png", itemName: "나이키 에어 포스 1 '07 로우 트리플 블랙", price: 115000),
        SavedItemModel(itemImage: "나이키 에어포스 1 '07 WB 플랙스.png", itemName: "나이키 에어포스 1 '07 WB 플랙스", price: 126000),
        SavedItemModel(itemImage: "뉴발란스 530 스틸 그레이.jpg", itemName: "뉴발란스 530 스틸 그레이", price: 96000),
        SavedItemModel(itemImage: "뉴발란스 993.jpg", itemName: "뉴발란스 993", price: 275000),
        SavedItemModel(itemImage: "슈프림 데님 캠프캡 블랙.png", itemName: "슈프림 데님 캠프캡 블랙", price: 101000),
        SavedItemModel(itemImage: "스투시 베이직 스투시 후드 블랙 2023.png", itemName: "스투시 베이직 스투시 후드 블랙 2023", price: 219000),
        SavedItemModel(itemImage: "아디다스 삼바 OG 블랙 화이트.png", itemName: "아디다스 삼바 OG 블랙 화이트", price: 113000),
        SavedItemModel(itemImage: "조던1 로우 카디널 레드.png", itemName: "조던1 로우 카디널 레드", price: 164000),
        SavedItemModel(itemImage: "카시오 MQ-24-1E.png", itemName: "카시오 MQ-24-1E", price: 20000)
    ]
}
