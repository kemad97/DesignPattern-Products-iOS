//
//  ProductRepositoryImpl.swift
//  MVP Products
//
//  Created by Kerolos on 13/05/2025.
//

import Foundation
class ProductRepositoryImpl: ProductRepository {
    
    let service: NetworkServiceProtocol!

   init(service: NetworkServiceProtocol) {
       self.service = service
   }
    
    func getProductsApi(completion: @escaping ([Product]) -> Void) {
    
        APIService.fetchProducts { response in
            
            completion (response.products)
        
        }
    }
    
    
}
