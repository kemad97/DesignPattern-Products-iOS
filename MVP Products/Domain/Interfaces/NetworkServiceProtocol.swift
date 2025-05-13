//
//  ProductServiceProtocol.swift
//  MVP Products
//
//  Created by Kerolos on 13/05/2025.
//

import Foundation

protocol NetworkServiceProtocol {
    static func fetchProducts(completion: @escaping (ProductResponse) -> Void)
}
