//
//  Location.swift
//  FindCarWash
//
//  Created by HannaJeon on 2017. 7. 30..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import Foundation

class Location {
    static var sharedInstance = Location()
    
    private(set) var latitude = Double()
    private(set) var longitude = Double()
    
    init() {}
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
