//
//  ProductDetailViewController.swift
//  MVP Products
//
//  Created by Kerolos on 11/05/2025.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    private var viewModel : ProductDetailViewModel!
    private var product: Product!

    
    func inject(viewModel: ProductDetailViewModel, product: Product) {
          self.viewModel = viewModel
          self.product = product
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.detailsChanged = { [weak self] in
            self?.title = self?.viewModel.title
            self?.priceLabel.text = self?.viewModel.price
            self?.txtView.text = self?.viewModel.description
            self?.imgView.image = self?.viewModel.image
        }
        
        if let product = product{
            viewModel.setProduct(product)
        }
        
        
   
    }
}
