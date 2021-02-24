//
//  Product.swift
//  Shop Demo
//
//  Created by Maksym Shovkovyi on 02/22/21.
//

import Foundation

struct Product: Equatable {
    private(set) public var productTitle: String
    private(set) public var productImage: String
    private(set) public var productPrice: Double
    private(set) public var productDescription: String!
    
    init(productTitle: String, productImage: String, productPrice: Double, productDescription: String) {
        self.productTitle = productTitle
        self.productImage = productImage
        self.productPrice = productPrice
        self.productDescription = productDescription
    }
}
