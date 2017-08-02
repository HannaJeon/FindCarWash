//
//  ViewController.swift
//  FindCarWash
//
//  Created by HannaJeon on 2017. 7. 30..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let networking = Networking()
    var carWashInfo = [CarWash]()
    var currentLocation = Location.sharedInstance
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(getCarWashInfo(_:)), name: NSNotification.Name("finishedGetCarWash"), object: networking)
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        mapView.clear()
//        mapView.delegate = nil
//        mapView.removeFromSuperview()
//        mapView = nil
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawCurrentLocation() {
        let camera = GMSCameraPosition.camera(withLatitude: currentLocation.latitude, longitude: currentLocation.longitude, zoom: 15.0)
        mapView.camera = camera
        mapView.delegate = self
//        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
        marker.icon = #imageLiteral(resourceName: "mypin")
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        mapView.settings.myLocationButton = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = manager.location?.coordinate
        
        if let currentLocation = location {
            self.currentLocation = Location(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
            networking.getCarWash(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
        }
//        drawCurrentLocation()
        locationManager.stopUpdatingLocation()
    }
    
    func getCarWashInfo(_ notification: Notification) {
        if let userInfo = notification.userInfo as? [String:[CarWash]] {
            if let carWash = userInfo["CarWash"] {
                carWashInfo = carWash
                insertCarWashMarker()
            }
        }
    }
    
    func insertCarWashMarker() {
        carWashInfo.forEach { (carWash) in
            createMaker(latitude: carWash.위도, longitude: carWash.경도, title: carWash.사업장명, snippet: carWash.소재지도로명주소)
        }
    }
    
    func createMaker(latitude: Double, longitude: Double, title: String, snippet: String) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.icon = #imageLiteral(resourceName: "mypin")
        marker.title = title
        marker.snippet = snippet
        marker.map = mapView
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let selectedMarker = mapView.selectedMarker {
            selectedMarker.icon = #imageLiteral(resourceName: "mypin")
        }
        mapView.selectedMarker = marker
        marker.icon = #imageLiteral(resourceName: "yourpin")
        return true
    }
    
}

