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
        let received_username = username
        let receive_phone_num = phone
        var ID = ""
        
        let parameters = [
            "username": received_username,
            "phone_number": receive_phone_num
        ]
        
        let url = "http://34.94.220.156/create_user"
        AF.request(url, method:.post, parameters:parameters,encoding: JSONEncoding.default).validate(contentType: ["application/json"]).responseString { response in
                    switch response.result {
                    case .success:
                        ID = String(JSON.init(parseJSON: response.value ?? "failed1")["id"].int ?? -1)
                        print("ID: \(ID)")
                    case .failure(let error):
                         print(error)
                    }
                }
      
        return ID
    }
}
