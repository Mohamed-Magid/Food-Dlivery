//
//  CartViewController.swift
//  Food-Dlivery
//
//  Created by Hany Karam on 12/7/19.
//  Copyright © 2019 Hany Karam. All rights reserved.
//

import UIKit

class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableview: UITableView!
    var items:[Model] = []
    override func viewDidLoad() {
        super.viewDidLoad()

      items = CartManager.shared.items
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        cell.img.image = UIImage(named: items[indexPath.row].image)
        
        cell.title.text = items[indexPath.row].title
        return cell
    }
    
    

}
