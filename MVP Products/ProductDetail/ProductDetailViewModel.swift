//
//  ProductDetailViewModel.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import Foundation
import UIKit

class ProductDetailViewModel {
   
    var title: String = ""
    var price: String = ""
    var description: String = ""
    var image: UIImage? = nil
    
    var detailsChanged: (() -> Void)?
    
    func setProduct(_ product: Product) {
        title = product.title ?? ""
        
        if let productPrice = product.price {
            price = String(productPrice)
        } else {
            price = " "
        }
        
        description = product.description ?? ""
        
        
        
        if let thumbnailString = product.thumbnail,
            let url = URL(string: thumbnailString) {
            loadImage(url)
        }
        detailsChanged?()

    }
    
    private func loadImage(_ url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, let loadedImage = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = loadedImage
                self.detailsChanged?()
            }
        }.resume()
    }
}
