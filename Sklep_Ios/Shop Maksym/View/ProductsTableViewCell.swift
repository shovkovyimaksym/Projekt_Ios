//
//  ProductsTableViewCell.swift
//  Shop Maksym
//
//  Created by Maksym Shovkovyi on 02/22/21.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateView(product: Product) {
        productImage.image = UIImage(named: product.productImage)
        productTitleLabel.text = product.productTitle
        productPriceLabel.text = String(product.productPrice)
    }

}
