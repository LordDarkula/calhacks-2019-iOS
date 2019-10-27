//
//  UserLoginRequest.swift
//  calhacks-2019
//
//  Created by Bhuvan Basireddy on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import Foundation
import Alamofire

class RequestData {
    static func sendLoginInfo(username: String, phone: String)-> String {
        let received_username = username
        let receive_phone_num = phone
        var ID = ""
        
        let parameters = [
            "name": received_username,
            "phone_num": receive_phone_num
        ]
        
        let url = "http://34.94.220.156/"
        AF.request(url, method:.post, parameters:parameters,encoding: JSONEncoding.default).responseJSON { response in
                    switch response.result {
                    case .success:
                        ID = response.value as! String
                    case .failure(let error):
                         print(error)
                    }
                }
      
        return ID
    }
}
