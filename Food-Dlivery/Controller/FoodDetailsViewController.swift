//
//  FoodDetailsViewController.swift
//  Food-Dlivery
//
//  Created by Hany Karam on 12/7/19.
//  Copyright © 2019 Hany Karam. All rights reserved.
//

import UIKit

class FoodDetailsViewController: UIViewController {
    var item:Model?

    @IBOutlet weak var image: UIImageView!
    
     @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var descrbtion: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let food = item{
            self.titlee.text = food.title
            self.image.image = UIImage(named: food.image)
            self.descrbtion.text = food.des
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
}
