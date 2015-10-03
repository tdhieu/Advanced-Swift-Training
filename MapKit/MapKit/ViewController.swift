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
        
        // Xac dinh do chinh xac vi tri cua minh
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Xac dinh xem nguoi dung co cho phep truy cap den vi tri cua minh hay ko
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
    }

    // fucntion duoc goi lien tuc khi di chuyen de load vi tri moi
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        // Ham tra ve vi tri va lo~i neu co'
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {
            (myLocation, error) -> Void in
            if error != nil {
                print("Error!!\n")
                return
            }
            
            
            // Array myLocation co phan tu
            if myLocation.count > 0 {
                let vitri = myLocation[0] as! CLPlacemark
                print(vitri.location)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

