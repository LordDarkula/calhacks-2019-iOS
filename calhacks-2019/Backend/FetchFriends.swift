//
//  Fetchfriends.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/27/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation

class FetchFriends: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var friends = [Friend]()
    let locationManager = CLLocationManager()
    var clock: Int = 0
    override init() {
        super.init()
        if UserDefaults.standard.string(forKey: "id") != "-1" {
           load()
        }
    }
    
    func load() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
        }
        
        
        
        let parameters = [
            "current_user_id": UserDefaults.standard.string(forKey: "id"),
                ]
        let url = "http://34.94.220.156/get_all_users"
        JSONData.POSTData(parameters: parameters, url: url,completion: { data in (JSON).self
            self.friends = [Friend]()
            for raw in data["friends"].arrayValue {
                print(raw["id"].int)
                print(raw["username"].string)
                print(raw["dist"].double)
                let friend = Friend(friendId: String(raw["id"].int!), name: raw["username"].string!, distance: raw["dist"].double!, imagePath: raw["image"].string!)
                self.friends.append(friend)
            }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let parameters = [
            "current_user_id": UserDefaults.standard.string(forKey: "id"),
            "current_user_lat": String(locValue.latitude),
            "current_user_long": String(locValue.latitude)
        ]
        let url = "http://34.94.220.156/save_user_loc"
        JSONData.POSTData(parameters: parameters, url: url,completion: { data in (JSON).self
            let status = String(data["status"].int ?? -1)
            // Do any additional setup after loading the view
            self.clock += 1
            print("status \(status)")
            //  any additional setup after loading the view.
            if(self.clock % 10 == 0) {
//                self.load()
                self.clock = 0
            }
            
        })
        
    }
    
}
