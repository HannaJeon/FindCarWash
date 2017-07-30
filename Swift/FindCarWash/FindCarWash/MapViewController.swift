//
//  ViewController.swift
//  FindCarWash
//
//  Created by HannaJeon on 2017. 7. 30..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let networking = Networking()
    var carWashInfo = [CarWash]()
    var currentLocation = Location()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.startUpdatingLocation()
//        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(getCurrentLocation(_:)), name: NSNotification.Name("currentLocation"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getCarWashInfo(_:)), name: NSNotification.Name("finishedGetCarWash"), object: networking)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: currentLocation.latitude, longitude: currentLocation.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        mapView.settings.myLocationButton = true
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        let location = manager.location?.coordinate
//        
//        if let currentLocation = location {
//            self.currentLocation = Location(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
//            networking.getCarWash(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
//        }
//        locationManager.stopUpdatingLocation()
//    }
    
    func getCurrentLocation(_ notification: Notification) {
        if let userInfo = notification.userInfo as? [String:Location] {
            if let location = userInfo["currentLocation"] {
                currentLocation = location
            }
        }
    }
    
    func getCarWashInfo(_ notification: Notification) {
        if let userInfo = notification.userInfo as? [String:[CarWash]] {
            if let carWash = userInfo["CarWash"] {
                carWashInfo = carWash
            }
        }
    }
    
}

