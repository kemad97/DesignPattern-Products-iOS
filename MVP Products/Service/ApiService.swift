//
//  ApiService.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import Foundation

protocol NetworkServiceProtocol {
    static func fetchProducts(completion: @escaping (ProductResponse) -> Void)
}

class APIService: NetworkServiceProtocol {
    
    private static let prodURL = "https://dummyjson.com/products"
    
    static func fetchProducts(completion: @escaping (ProductResponse) -> Void) {
        guard let url = URL(string: prodURL) else {
            completion(ProductResponse(products: []))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(productResponse)
                    }
                } catch {
                    print("Error decoding response: \(error)")
                    DispatchQueue.main.async {
                        completion(ProductResponse(products: []))
                    }
                }
            } else {
               
                DispatchQueue.main.async {
                    completion(ProductResponse(products: []))
                }
            }
        }.resume()
    }
}
