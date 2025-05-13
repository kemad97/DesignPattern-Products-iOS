//
//  GetProductUseCase.swift
//  MVP Products
//
//  Created by Kerolos on 13/05/2025.
//

import Foundation

protocol GetProductsUseCase {
    func execute(completion : @escaping ([Product] ) ->Void)
}

class GetProductsUseCaseImpl : GetProductsUseCase {
    
    
    private let repository: ProductRepository
       
       init(repository: ProductRepository) {
           self.repository = repository
       }
    
    func execute(completion: @escaping ([Product]) -> Void) {
        repository.getProductsApi(completion: completion)
    }
    
    
}
