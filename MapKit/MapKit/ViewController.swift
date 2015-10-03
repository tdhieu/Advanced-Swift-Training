//
//  ViewController.swift
//  MapKit
//
//  Created by Tran Duc Hieu on 10/3/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet var myMap: MKMapView!
    
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
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (myLocation, error) -> Void in
            if error != nil {
                print("Error!!\n")
                return
            }
            
            // Array myLocation co phan tu
            if myLocation.count > 0 {
                let vitri = myLocation[0] as! CLPlacemark
                self.DisplayLocationInfo(vitri)
            }
        })
    }
    
    func DisplayLocationInfo(vitri: CLPlacemark) {
        let longitude = vitri.location.coordinate.longitude
        let latitude = vitri.location.coordinate.latitude
        println(vitri.location)
/*        println(vitri.addressDictionary)
        println(vitri.locality)
        println(vitri.postalCode)
        println(vitri.administrativeArea)
        println(vitri.subAdministrativeArea)
        println(vitri.country)
        println(vitri.postalCode)
        println(vitri.subLocality) */
        
        var annotation = MKPointAnnotation()
        annotation.title = "My Location"
        annotation.coordinate = vitri.location.coordinate
        self.myMap.addAnnotation(annotation)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

