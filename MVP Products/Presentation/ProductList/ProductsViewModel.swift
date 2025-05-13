//
//  ProductPresenter.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import Foundation



class ProductsViewModel {
    
    var products : [Product] = [] {
        didSet {
            productsChanged?(products)
        }
    }
    
    private let getProductsUseCase : GetProductsUseCase
    
    init(getProductsUseCase: GetProductsUseCase) {
        self.getProductsUseCase = getProductsUseCase
    }
    
    
    var productsChanged : ( ([Product]) -> Void)?
    var didSelectProduct: ( (Product) -> Void)?
    
    func loadProducts() {
        
        APIService.fetchProducts { [weak self] response in
            guard let self = self else { return }
            
            self.products = response.products
        }
    }
    
    func selectProduct(at index: Int) {
        didSelectProduct?(products[index])
    }

}
