//
//  Product.swift
//  GodardBaptiste
//
//  Created by Baptiste Godard on 31/01/2022.
//

import Foundation

class Product {
    let name: String
    var price: Double
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    
    func setPrice() {
        self.price = Double.random(in:(self.price-self.price*0.1) ..< (self.price+self.price*0.1))
    }
}
