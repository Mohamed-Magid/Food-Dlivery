//
//  MapModel.swift
//  Food-Dlivery
//
//  Created by Hany Karam on 12/7/19.
//  Copyright © 2019 Hany Karam. All rights reserved.
//

import Foundation
import MapKit
class MapModel: NSObject,MKAnnotation {
    var title:String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    init(title:String,subtitle:String,location:CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = location
    }
    
}
