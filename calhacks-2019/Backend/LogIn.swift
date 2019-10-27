//
//  LogIn.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/27/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import Foundation
import SwiftyJSON

class Login {
    static func login(number: String, username: String) {
        let parameters = [
            "username": username,
            "phone_number": number
        ]
        let url = "http://34.94.220.156/create_user"
        JSONData.POSTData(parameters: parameters, url: url,completion: { data in (JSON).self
            let ID = String(data["id"].int ?? -1)
            // Do any additional setup after loading the view
            
            print("id: \(ID)")
            //  any additional setup after loading the view.
            UserDefaults.standard.set(ID, forKey: "id")
            
        })
    }
}
