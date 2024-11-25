//
//  SearchResponseModel.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/22/24.
//

import Foundation

// MARK: - Welcome
struct SearchResponseModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description, category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand, sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation, availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt, barcode, qrCode: String
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment, date, reviewerName, reviewerEmail: String
}
