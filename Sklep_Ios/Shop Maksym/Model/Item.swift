//
//  Cart.swift
//  Shop Demo
//
//  Created by Maksym Shovkovyi on 02/22/21.
//

import Foundation

struct Item: Equatable {
    
    var product: Product
    var quantity: Int
    var totalPrice: Double
    
    init(product: Product, quantity: Int, totalPrice: Double) {
        self.product = product
        self.quantity = quantity
        self.totalPrice = totalPrice
    }
    
    // Equatable Protocol
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.product == rhs.product
        
    }
}


