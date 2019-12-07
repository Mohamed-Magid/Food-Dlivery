//
//  FoodModel.swift
//  Food-Dlivery
//
//  Created by Hany Karam on 12/7/19.
//  Copyright © 2019 Hany Karam. All rights reserved.
//

import Foundation
class FoodModel {
    var image:String
    var title:String
    var price:String
    init(image:String,title:String,price:String) {
        self.image = image
        self.title = title
        self.price = price
    }
}
