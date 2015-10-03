//
//  ViewController.swift
//  MapKit
//
//  Created by Tran Duc Hieu on 10/3/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        // Xac dinh tinh chinh xac vi tri cua minh
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Xac dinh xem nguoi dung co cho phep app truy cap den vi tri cua minh hay ko
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

