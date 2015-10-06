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
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        myMap.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: "CreateLocation:"))
    }

    func CreateLocation(recognizer: UILongPressGestureRecognizer){
        
        // Lay toa do cua ngon tay cham tren man hinh
        let myTouch = recognizer.locationInView(self.myMap)
        
        // Chuyen doi toa do cua ngon tay thanh toa do cua ban do (kinh do, vi do)
        let newCoordinate:CLLocationCoordinate2D = myMap.convertPoint(myTouch, toCoordinateFromView: self.myMap)
        
        var annotation = MKPointAnnotation()
        annotation.title = "Toa do moi"
        annotation.coordinate = newCoordinate
        self.myMap.addAnnotation(annotation)
        
        var pointA:CLLocation = CLLocation(latitude: locationManager.location.coordinate.latitude, longitude: locationManager.location.coordinate.longitude)
        
        // Chuyen doi gia tri tu Coordinate thanh CLLocation
        var pointB:CLLocation = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
        
        var result = pointA.distanceFromLocation(pointB) // gia tri khoang cach la metre
        
        print(String(stringInterpolationSegment: result/1000) + "km\n")
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
        
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.1
        
        var annotation = MKPointAnnotation()
        annotation.title = "My Location"
        annotation.coordinate = vitri.location.coordinate
        self.myMap.addAnnotation(annotation)
        
        // Tao bien truyen ti le zoom vao
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        // Tao bien toa do location
        let location:CLLocationCoordinate2D = vitri.location.coordinate
        // Gan cac bien vao cho region
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        // Roi add vao ban do
        self.myMap.setRegion(region, animated: true)
        
        locationManager.stopUpdatingLocation()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

