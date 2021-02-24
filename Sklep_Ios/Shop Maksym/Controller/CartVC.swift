//
//  CartVC.swift
//  Shop Maksym
//
//  Created by Maksym Shovkovyi on 02/22/21.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ParentTableViewControllerDelegate {
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var shoppingCartTableView: UITableView!
    
    var shoppingCartItems = ShoppingCartService.instance.getCart()
    var subtotal: Double = 0.00
    var shipping: Double = 0.00
    var tax: Double = 0.00
    var totalPrice: Double = 0.00
    

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingCartTableView.delegate = self
        shoppingCartTableView.dataSource = self

        getShoppingCartTotalPrice()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell {
                    let cartProduct = shoppingCartItems[indexPath.row]
                    
                    cell.updateViews(item: cartProduct)
                    cell.parentTableViewDelegate = self
                    return cell
                }
                else {
                    return CartTableViewCell()
                }
        
    }
    
    func getShoppingCartTotalPrice() {
        var itemTotalPrice: Double = 0.00
        var cartTotal: Double = 0.00
        
        for item in shoppingCartItems {
            
            itemTotalPrice = Double(item.quantity) * item.totalPrice
            cartTotal += itemTotalPrice
            
        }
        subtotal = cartTotal
        tax = subtotal * 0.10
        
        // TODO: Extract this into its own function
        if subtotal <= 0 {
            shipping = 0.00
        } else {
            shipping = 10.00
        }
        totalPrice = subtotal + tax + shipping
        
        let subtotalFormat = String(format: "%.2f", subtotal)
        let taxFormat = String(format: "%.2f", tax)
        let totalPriceFormat = String(format: "%.2f", totalPrice)
        let shippingFormat = String(format: "%.2f", shipping)
        
        subtotalLabel.text = subtotalFormat
        taxLabel.text = taxFormat
        shippingLabel.text = shippingFormat
        totalLabel.text = totalPriceFormat
    }
    
    
    
    func requestReloadTableViewData() {
            shoppingCartItems = ShoppingCartService.instance.getCart()
            getShoppingCartTotalPrice()
            shoppingCartTableView.reloadData()
    }
    @IBAction func purchaseButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "PaymentSuccess", sender: (Any).self)
    }
    
}

protocol ParentTableViewControllerDelegate {
    func requestReloadTableViewData()
}
