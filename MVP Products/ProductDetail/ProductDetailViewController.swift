//
//  ProductDetailViewController.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import UIKit

class ProductDetailViewController: UIViewController, ProductDetailView {
    
    @IBOutlet weak var txtView: UITextView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var product:Product?
    var presenter = ProductDetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(v: self)
        if let product = product {
            presenter.loadProductDetails(product)
        }
    }
    
    
    func displayTitle(_ title: String) {
        self.title = title
            
    }
    
    func displayPrice(_ price: String) {
        priceLabel.text = price

    }
    
    func displayDescription(_ description: String) {
        txtView.text = description

    }
    
    func displayImage(_ image: UIImage) {
        imgView.image = image

    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
