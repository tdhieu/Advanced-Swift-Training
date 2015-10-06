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

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    let locationManager = CLLocationManager()
    
    var myRoute:MKRoute = MKRoute()
    
    @IBOutlet var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        // Xac dinh do chinh xac vi tri cua minh
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Xac dinh xem nguoi dung co cho phep truy cap den vi tri cua minh hay ko
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        myMap.delegate = self
        
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
        
//        print(String(stringInterpolationSegment: result/1000) + "km\n")
        
        
        // Ve duo`ng di cho 2 diem, 2 diem nay phai thuoc loai MKPointAnnotation thi` MapKit moi ve duoc
        var point1 = MKPointAnnotation()
        var point2 = MKPointAnnotation()
        
        point1.coordinate = pointA.coordinate
        myMap.addAnnotation(point1)
        
        point2.coordinate = pointB.coordinate
        myMap.addAnnotation(point2)
        
        // Span of the map
        myMap.setRegion(MKCoordinateRegionMake(point1.coordinate, MKCoordinateSpanMake(0.01, 0.01)), animated: true)
        
        var directionsRequest = MKDirectionsRequest()
        
        // Chuyen vi tri cua 2 annotation ve` da.ng MKPlacemark
        let position1 = MKPlacemark(coordinate: CLLocationCoordinate2DMake(point1.coordinate.latitude, point1.coordinate.longitude), addressDictionary: nil)
        
        let position2 = MKPlacemark(coordinate: CLLocationCoordinate2DMake(point2.coordinate.latitude, point2.coordinate.longitude), addressDictionary: nil)
        
        // Xác định vẽ đường đi từ đâu:
        directionsRequest.setSource(MKMapItem(placemark: position1))
        
        // Xác định vẽ đường đi đến đâu:
        directionsRequest.setDestination(MKMapItem(placemark: position2))
        
        // Xác định kiểu vẽ đường đi: đi bộ, đi xe,...
        directionsRequest.transportType = MKDirectionsTransportType.Automobile
        
        // Tien ha`nh ve~ duo`ng di
        var directions = MKDirections(request: directionsRequest)
        
        directions.calculateDirectionsWithCompletionHandler { (response: MKDirectionsResponse!, error: NSError!) -> Void in
            if error == nil {
                // Kiem tra neu khong co loi thi lay phan tu duong di da`u tien cua routes va` add va`o map
                self.myRoute = (response.routes[0] as? MKRoute)!
                self.myMap.addOverlay(self.myRoute.polyline)
            }
        }
    }
    
    // Điều chỉnh map để hiển thị đường đi giữa hai điểm
    func mapView(mapView:MKMapView!, rendererForOverlay overlay:MKOverlay!) -> MKOverlayRenderer! {
        var myLineRenderer = MKPolylineRenderer(polyline: myRoute.polyline)
        myLineRenderer.strokeColor = UIColor.redColor()
        myLineRenderer.lineWidth = 3
        return myLineRenderer
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
/*        println(vitri.location)
        println(vitri.addressDictionary)
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

