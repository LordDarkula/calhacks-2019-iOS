//
//  ReturnJSON.swift
//  calhacks-2019
//
//  Created by Bhuvan Basireddy on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class JSONData {
    static func POSTData(parameters: Parameters , url: String, completion: @escaping (_ json: JSON) -> Void)-> Void {
        AF.request(url, method:.post, parameters:parameters, encoding: JSONEncoding.default).responseString { response in
                           switch response.result {
                            
                           case .success:
                               var data = JSON.init(parseJSON: response.value ?? "{\"a\": 1}")
                               completion(data ?? "test")
                           case .failure(let error):
                                completion(JSON() ?? "error")
                           }
                       }
    }
    static func GETData(parameters: Parameters, url: String)-> JSON {
           var data: JSON=JSON()
           AF.request(url, method:.get, parameters:parameters, encoding: JSONEncoding.default).validate(contentType: ["application/json"]).responseString { response in
                              switch response.result {
                              case .success:
                                  data = JSON.init(parseJSON: response.value ?? "failed1")
                                  
                              case .failure(let error):
                                   print(error)
                              }
                          }
           return data
       }
    
}
