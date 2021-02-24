//
//  CartTableViewCell.swift
//  Shop Maksym
//
//  Created by Maksym Shovkovyi on 02/22/21.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    var currentItemsInShoppingCart: Item!
    var parentTableViewDelegate: ParentTableViewControllerDelegate?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func quantityLessButtonPressed(_ sender: UIButton) {
        ShoppingCartService.instance.updateShoppingCartItemQuantity(items: currentItemsInShoppingCart, itemsPurchased: 0)
        parentTableViewDelegate?.requestReloadTableViewData()
    }
    @IBAction func quantityMoreButtonPressed(_ sender: UIButton) {
        ShoppingCartService.instance.updateShoppingCartItemQuantity(items: currentItemsInShoppingCart, itemsPurchased: 1)
        parentTableViewDelegate?.requestReloadTableViewData()
    }
    
    func updateViews(item: Item) {
        productImage.image = UIImage(named: item.product.productImage)
        productName.text = "\(item.product.productTitle)"
        productPrice.text = "$ \(item.product.productPrice)"
        quantityLabel.text = "\(item.quantity)"
                
        currentItemsInShoppingCart = item
        
    }
    
}
