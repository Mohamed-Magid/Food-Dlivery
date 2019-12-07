//
//  popularViewController.swift
//  Food-Dlivery
//
//  Created by Hany Karam on 12/6/19.
//  Copyright © 2019 Hany Karam. All rights reserved.
//

import UIKit

class popularViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
 var food = [Model]()
    var popularfood = [FoodModel]()
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        collection.dataSource = self
        collection.delegate = self
        
        food.append(Model(image: "Screen Shot 2019-12-07 at 12.18.59 AM", title: "Drink", price: 0, des: "", id: 0, quantity: 0))
        
        food.append(Model(image: "icons8-jam-48", title: "BreakFast", price: 0, des: "", id: 0, quantity:0 ))
        
        food.append(Model(image: "icons8-spaghetti-100", title: "Lunch", price: 0, des: "", id: 0, quantity:0))
        
        food.append(Model(image: "icons8-cookie-100", title: "Dinner",  price: 0, des: "", id: 0, quantity:0 ))
        
        popularfood.append(FoodModel(image: "Share-Box", title: "Share Box",price:""))
        
        
        
        popularfood.append(FoodModel(image: "Large-Frise", title: "Large Frise",price:""))
        
        
        popularfood.append(FoodModel(image: "Milkshake-Choco", title: "Milkshake Choco",price:""))
        
        
         popularfood.append(FoodModel(image: "Big-tasty-Beef-1", title: "Big tasty Beef",price:""))
        
        

    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return food.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FoodCollectionViewCell
    cell.image.image = UIImage(named: food[indexPath.row].image)
        cell.title.text = food[indexPath.row].title
        return cell
        
    }
    

}
extension popularViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularfood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FoodTableViewCell
        cell.img.image = UIImage(named:popularfood[indexPath.row].image)
        cell.title.text = popularfood[indexPath.row].title
        
        return cell
    }
    
    
}
