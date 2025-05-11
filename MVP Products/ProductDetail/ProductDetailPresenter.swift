//
//  ProductDetailPresenter.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import Foundation
import UIKit


protocol ProductDetailView: AnyObject {
    func displayTitle(_ title: String)
    func displayPrice(_ price: String)
    func displayDescription(_ description: String)
    func displayImage(_ image: UIImage)
}


class ProductDetailPresenter {
    
    private weak var detailView:ProductDetailView?
    private var product:Product?
    
    func attachView (v:ProductDetailView){
        self.detailView = v
    }
    
    func loadProductDetails (_ prod:Product){
        self.product = prod
        
        detailView?.displayPrice(String( product?.price ?? 0.0))
        detailView?.displayDescription(product?.description ?? "No Desc")
        
        if let thumbnailString = product?.thumbnail, let url = URL(string: thumbnailString) {
            loadImage(from: url)
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.detailView?.displayImage(image)
                }
            }
        }.resume()
    }
    
    
    
}


