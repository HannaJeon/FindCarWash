//
//  Networking.swift
//  FindCarWash
//
//  Created by HannaJeon on 2017. 7. 30..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import Foundation

class Networking {
    
    private let url: String = {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: path!)
        let url = plist?["URL"] as! String
        return url
    }()
    
    func getCarWash() {
        
    }
}
