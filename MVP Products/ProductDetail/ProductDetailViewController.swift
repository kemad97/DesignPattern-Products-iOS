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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails()

    }
    func showDetails() {
        guard let product = product else { return }
               
               title = product.title
               
              // titleLabel.text = product.title
        priceLabel.text = String(format: "$%.2f", product.price ?? 0.0 )
               txtView.text = product.description
               
               // Load product image
               if let thumbnailString = product.thumbnail, let url = URL(string: thumbnailString) {
                   URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                       if let data = data, let image = UIImage(data: data) {
                           DispatchQueue.main.async {
                               self?.imgView.image = image
                           }
                       }
                   }.resume()
               }
           }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


