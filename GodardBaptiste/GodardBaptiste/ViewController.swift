//
//  ViewController.swift
//  GodardBaptiste
//
//  Created by Baptiste Godard on 31/01/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var myProduct = [Product]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! TableViewCell
        
        cell.product_name.text = myProduct[indexPath.row].name
        cell.product_price.text = String (format: "%.2f", myProduct[indexPath.row].price)
        
        let moyPrice = calcTotal() / Double(myProduct.count)
        let moyhautePrice = moyPrice*0.8
        let moybassePrice = moyPrice*0.2
            
        if (myProduct[indexPath.row].price <= moybassePrice) {
                cell.backgroundColor = UIColor.green
        }
        else if (myProduct[indexPath.row].price >= moyhautePrice) {
            cell.backgroundColor = UIColor.blue
        }
        else {
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    

    @IBOutlet weak var MyTableView: UITableView!
    @IBOutlet weak var totprice: UILabel!
    @IBAction func sortProduct(_ sender: Any) {
        myProduct.sort{
            $0.price < $1.price
        }
        MyTableView.reloadData()
    }
    
    @IBAction func majPrice(_ sender: Any) {
        if (!myProduct.isEmpty) {
            for i in 0 ... myProduct.count-1{
                myProduct[i].setPrice()
            }
        }
        MyTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyTableView.dataSource = self
        fillProduct()
        totprice.text = "Prix total : " + String (format: "%.2f", calcTotal())
    }
    
    func fillProduct(){
        let ps5 = Product(name: "Console PS5", price: 499.00)
        let joystick = Product(name: "Manette PS5", price: 69.00)
        let fifa22 = Product(name: "Fifa 22", price: 59.99)
        let iphone12 = Product(name: "iPhone 12", price: 899.99)
        let protection = Product(name: "Coque iPhone 12", price: 29.99)
        let glass = Product(name: "Vitre protection iPhone 12", price: 9.99)
        let mouse = Product(name: "Magi Mouse", price: 49.99)
        let webcam = Product(name: "WebCam 4K", price: 84.90)
        let mbp16 = Product(name: "Macbook Pro 16", price: 2000.00)
        let rubik = Product(name: "Rubik Cube", price: 20.00)
        let bag = Product(name: "Sac de transport ordinateur", price: 59.99)
        let stamps = Product(name: "Carnet de timbres", price: 15.36)
        let greentea = Product(name: "Boite de thé vert", price: 5.50)
        let pens = Product(name: "Lot de crayons", price: 2.00)
        
        myProduct = [ps5, joystick, fifa22, iphone12, protection, glass, mouse, webcam, mbp16, rubik, bag, stamps, greentea, pens ]
    }
    
    func calcTotal() -> Double {
        if !myProduct.isEmpty {
            var pricetot = 0.0
            for i in 0 ... myProduct.count-1{
                pricetot += myProduct[i].price
            }
            return pricetot
        }
        else {
            return 0
        }
    }
}
