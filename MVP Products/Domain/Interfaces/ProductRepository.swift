//
//  ProductRepository.swift
//  MVP Products
//
//  Created by Kerolos on 13/05/2025.
//

import Foundation
protocol ProductRepository {
    
  
    func getProductsApi(completion: @escaping ([Product]) -> Void)
}
