//
//  ProductsVCViewController.swift
//  Shop Maksym
//
//  Created by Maksym Shovkovyi on 02/22/21.
//

import UIKit

class ProductsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    private(set) public var products = [Product]()
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsTableView.delegate = self
        productsTableView.dataSource = self

        if let selectedCategory = category {
            initProducts(category: selectedCategory)
        }
    }
    
    func initProducts(category: Category) {
        products = DataService.instance.getProducts(categoryTitle: category.title)
        categoryLabel.text = category.title
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.productsTableView {
            return products.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as? ProductsTableViewCell {
            let item = products[indexPath.row]
            cell.updateView(product: item)
            return cell
        } else {
            return ProductsTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        performSegue(withIdentifier: "goToDetailFromProducts", sender: selectedProduct)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productDetailsVC = segue.destination as? ProductDetailsVC {
            productDetailsVC.product = sender as? Product
        }
    }
    
    
}
