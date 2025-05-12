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
    
    var product:Product?
    private let viewModel = ProductDetailViewModel()
    
    
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
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
        
    }
}
