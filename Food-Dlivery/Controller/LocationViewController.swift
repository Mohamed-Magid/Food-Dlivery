//
//  LocationViewController.swift
//  Food-Dlivery
//
//  Created by Hany Karam on 12/7/19.
//  Copyright © 2019 Hany Karam. All rights reserved.
//

import UIKit
import MapKit
class LocationViewController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = CLLocationCoordinate2D(latitude: 30.0072, longitude: 30.9745)
        let region  = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        MapView.setRegion(region, animated: true)
        let map = CLLocationCoordinate2D(latitude: 30.0072, longitude: 30.9745)
        
        let location = MapModel(title: "Macdonl's", subtitle: "this location in giza", location: map)
        MapView.addAnnotation(location)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
