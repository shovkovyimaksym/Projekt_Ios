//
//  ShoppingCartService.swift
//  Shop Maksym
//
//  Created by Maksym Shovkovyi on 02/22/21.
//

import Foundation

class ShoppingCartService {
    static let instance = ShoppingCartService()
    private(set) var item: Item!
    private(set) var shoppingCartItems = [Item]()
    
    func getCart() -> [Item] {
        return shoppingCartItems
    }
    
    func addProductToCart(productAdded: Product?) {
        if let product = productAdded {
            item = Item(product: product, quantity: 1, totalPrice: product.productPrice)
            
            if shoppingCartItems.contains(item) {
                updateShoppingCartItemQuantity(items: item, itemsPurchased: 1)
            }
            else {
                shoppingCartItems.append(item)
            }
        }
    }
    
    func updateShoppingCartItemQuantity(items cartItems: Item, itemsPurchased purchased: Int) {
        
        if let itemIndex = shoppingCartItems.firstIndex(of: cartItems) {
            item = cartItems
            var quantity = shoppingCartItems[itemIndex].quantity
            
            if purchased == 1 {
                quantity += 1
            } else if purchased == 0 {
                quantity -= 1
                if quantity == 0 {
                    shoppingCartItems.remove(at: itemIndex)
                    return
                }
            }
            item.quantity = quantity
            shoppingCartItems[itemIndex] = item
        }
    }
    
    func clearShoppingCartItems() {
        shoppingCartItems.removeAll()
    }
    
}
