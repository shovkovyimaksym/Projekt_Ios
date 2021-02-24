//
//  DataService.swift
//  Shop Maksym
//
//  Created by Maksym Shovkovyi on 02/22/21.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    // FEATURED PRODUCTS
    private let featuredProducts = [
        Product(productTitle: "Morelia Series 1", productImage: "morelia1.png", productPrice: 19.99, productDescription: "Building on the original blueprint of the boot, the Morelia has been given an injection of innovation thanks to its new, lightweight materials that offer a barefoot feeling, resulting in a more comfortable, natural touch on the pitch. A boot released to usher in a new decade for Mizuno, this new modern boot has been designed with one thing in mind: speed"),
        Product(productTitle: "Morelia Series 2", productImage: "morelia2.png", productPrice: 29.99, productDescription: "djkjs djsk jdsk dj djks djk dsdj ksd ks"),
        Product(productTitle: "Morelia Series 1", productImage: "morelia1.png", productPrice: 19.99, productDescription: "djkjs djsk jdsk dj djks djk dsdj ksd ks"),
        Product(productTitle: "Nike Mercurial", productImage: "nike_1.png", productPrice: 29.99, productDescription: "djkjs djsk jdsk dj djks djk dsdj ksd ks")
    ]
    
    func getFeaturedProducts() -> [Product] {
        return featuredProducts
    }
    
    // CATEGORIES
    
    private let categories = [
        Category(title: "Soccer Shoes", imageName: "soccer_shoes.png"),
        Category(title: "Soccer Jerseys", imageName: "soccer_jerseys.png"),
        Category(title: "Soccer Balls", imageName: "soccer_balls.png")
    ]
    
    func getCategories() -> [Category] {
        return categories
    }
    
    private let soccerBalls = [
        Product(productTitle: "Messi Capitano", productImage: "messi_capitano", productPrice: 13.99, productDescription: "Master your skills with a ball displaying the name of the world's greatest player. This hard-wearing soccer ball is built for training and recreation. Its TPU cover is machine stitched for durability, and the butyl bladder keeps it inflated and ready for action."),
        Product(productTitle: "Adiddas UCL Finale", productImage: "adiddas_ucs", productPrice: 28.99, productDescription: "Champions do battle where two worlds collide. The lush graphics on this adidas soccer ball flow from the UEFA Champions League official ball. Its seamless design and FIFA stamp mean you'll have no excuses when you send it over the fence during shooting practice."),
        Product(productTitle: "Adidas MLS Nativo", productImage: "mls_nativo", productPrice: 19.99, productDescription: "Celebrating 25 consecutive years of elite club soccer in the US and Canada. Created for scrimmages, this adidas MLS Nativo XXV Club Ball has a dynamic design that's based on the look of the MLS official ball. The machine-stitched construction and butyl bladder mean it's ready to roll whenever you are.")
    ]
    
    private let soccerShoes = [
        Product(productTitle: "Morelia Series 2", productImage: "morelia2.png", productPrice: 29.99, productDescription: "Nike Mercurial Superfly VII Elite AG CR7 Cristiano Ronaldo Shuai - Blue/White/Orange Soccer Cleats are bright blue with a pink Swoosh and an all-over Chinese script pattern in white. The Chinese text on the upper reads Tong Shuai, which translates to Stylish Commander"),
        Product(productTitle: "Morelia Series 1", productImage: "morelia1.png", productPrice: 19.99, productDescription: "Nike Mercurial Superfly VII Elite AG CR7 Cristiano Ronaldo Shuai - Blue/White/Orange Soccer Cleats are bright blue with a pink Swoosh and an all-over Chinese script pattern in white. The Chinese text on the upper reads Tong Shuai, which translates to Stylish Commander"),
        Product(productTitle: "Nike Mercurial", productImage: "nike_1.png", productPrice: 29.99, productDescription: "Nike Mercurial Superfly VII Elite AG CR7 Cristiano Ronaldo Shuai - Blue/White/Orange Soccer Cleats are bright blue with a pink Swoosh and an all-over Chinese script pattern in white. The Chinese text on the upper reads Tong Shuai, which translates to Stylish Commander")
    ]
    
    private let soccerJerseys = [
        Product(productTitle: "Germany", productImage: "germany.png", productPrice: 29.99, productDescription: "Germany 2018 Home Replica Jersey. The Same JerseyA Germany Will Wear During The 2018 World Cup!"),
        Product(productTitle: "Club America Jersey", productImage: "america.png", productPrice: 29.99, productDescription: "Club America Jersey."),
        Product(productTitle: "Ireland Away Jersey", productImage: "ireland.png", productPrice: 29.78, productDescription: "Ireland Away Jersey. The same jersey they wore in the 2018 World Cup!")
    ]
    
    func getProducts(categoryTitle: String) -> [Product] {
        switch categoryTitle {
        case "Soccer Balls":
            return getSoccerBalls()
        case "Soccer Shoes":
            return getSoccerShoes()
        case "Soccer Jerseys":
            return getSoccerJerseys()
        default:
            return getSoccerShoes()
        }
    }
    
    func getSoccerJerseys() -> [Product] {
        return soccerJerseys
    }
    
    func getSoccerShoes() -> [Product] {
        return soccerShoes
    }
    
    func getSoccerBalls() -> [Product] {
        return soccerBalls
    }
    
}
