//
//  Product.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import Foundation
struct Product: Codable {
    let id: Int
    let title: String?
    let description: String?
    let price: Double?
    let rating: Double?
    let brand: String?
    let thumbnail: String?
}

struct ProductResponse: Codable {
    let products: [Product]
}
