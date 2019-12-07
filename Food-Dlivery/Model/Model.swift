//
//  Model.swift
//  Food-Dlivery
//
//  Created by Hany Karam on 12/6/19.
//  Copyright © 2019 Hany Karam. All rights reserved.
//

import Foundation
class Model {
    var image:String
    var title:String
    var price:Int
    var des:String
    var id:Int
    var quantity:Int
    init(image:String,title:String,price:Int,des:String,id:Int,quantity:Int) {
        self.image = image
        self.title = title
        self.price = price
        self.des = des
        self.id = id
        self.quantity = quantity
    }
}
