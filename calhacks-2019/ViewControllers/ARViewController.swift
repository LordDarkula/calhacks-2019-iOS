//
//  ARViewController.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import UIKit
import ARCL
import CoreLocation
import SwiftyJSON

class ARViewController: UIViewController {
    var phoneNumber: String = ""
    var username: String = ""
    var ID = ""
    
    var sceneLocationView = SceneLocationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let parameters = [
            "username": username,
            "phone_number": phoneNumber
        ]
        let url = "http://34.94.220.156/create_user"
        JSONData.POSTData(parameters: parameters, url: url,completion: { data in (JSON).self
            let ID = String(data["id"].int ?? -1)
            // Do any additional setup after loading the view.
            self.sceneLocationView.run()
            self.view.addSubview(self.sceneLocationView)
            
        })
//        ID = RequestData.sendLoginInfo(username: username, phone: phoneNumber)
    }
    
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      sceneLocationView.frame = view.bounds
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        sceneLocationView.pause()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
