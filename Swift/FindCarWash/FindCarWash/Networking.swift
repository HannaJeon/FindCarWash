//
//  Networking.swift
//  FindCarWash
//
//  Created by HannaJeon on 2017. 7. 30..
//  Copyright © 2017년 HannaJeon. All rights reserved.
//

import Foundation
import Alamofire

class Networking {
    
    private let url: String = {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: path!)
        let url = plist?["URL"] as! String
        return url
    }()
    
    func getCarWash(latitude: Double, longitude: Double) {
        let parameters = ["latitude": latitude, "longitude": longitude]
        
        Alamofire.request("\(url)/carwash", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            var carWash = [CarWash]()
            
            if let contents = response.result.value as? [[String:Any]] {
                for content in contents {
                    let carWashInfo = CarWash(carWash: content)
                    carWash.append(carWashInfo)
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name("finishedGetCarWash"), object: self, userInfo: ["CarWash" : carWash])
        }
    }
}
