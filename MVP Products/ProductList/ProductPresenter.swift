//
//  ProductPresenter.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import Foundation

protocol ProductsListViewProtocol: AnyObject {
    func showProducts(_ products: [Product])
    func navigateToProductDetail(_ product: Product)
}

class ProductsPresenter {
    weak private var view:ProductsListViewProtocol?
    
    private var products :[Product] = []
    
    init (view : ProductsListViewProtocol)
    {
        self.view=view
    }
    
    func viewDidLoad (){
        loadProducts()
    }
    
    func didSelectProduct(at index: Int) {
        if index >= 0 && index < products.count {
            view?.navigateToProductDetail(products[index])
        }
    }

    private func loadProducts() {
           
           APIService.fetchProducts { [weak self] result in
               DispatchQueue.main.async {
                   
                   switch result {
                   case .success(let products):
                       self?.products = products
                       self?.view?.showProducts(products)
                   case .failure(let error):
                       print(error)
                   }
               }
           }
       }
}
