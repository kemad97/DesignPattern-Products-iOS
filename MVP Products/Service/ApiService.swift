//
//  ApiService.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import Foundation

protocol NetworkServiceProtocol {
    static func fetchProducts (completion: @escaping (Result <[Product] , Error >) ->Void )
}

class APIService: NetworkServiceProtocol {
    
    private static let prodURL = "https://dummyjson.com/products"
    
    static func fetchProducts (completion: @escaping (Result <[Product] , Error >) ->Void )
    {
        guard let url = URL(string: prodURL) else{
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
                return
        }
        
        URLSession.shared.dataTask(with: url) { data , response , error in
            if let error=error
            {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -2, userInfo: nil)))
                return
            }

            do {
                let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                completion(.success(productResponse.products))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
