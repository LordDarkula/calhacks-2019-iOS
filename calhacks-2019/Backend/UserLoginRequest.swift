//
//  UserLoginRequest.swift
//  calhacks-2019
//
//  Created by Bhuvan Basireddy on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestData {
    static func sendLoginInfo(username: String, phone: String)-> String {
        let parameters = [
            "username": username,
            "phone_number": phone
        ]
        
        let url = "http://34.94.220.156/create_user"
//        let data: JSON = JSONData.POSTData(parameters: parameters, url: url,completion: (JSON) -> Void {
//
//        })
//        print("JSON: \(data)")
//        print("ID: \(data["id"])")
//        let ID = String(data["id"].int ?? -1)
        
        
        return ""
    }
}
