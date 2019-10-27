//
//  File.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/27/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import Foundation
import UIKit

class Friend: Identifiable {
    var name: String
    var distance: Double
    var imagePath: String
    var image: UIImage
    init(name: String, distance: Double, imagePath: String) {
        self.name = name
        self.distance = distance
        self.imagePath = imagePath
        let url = URL(string: self.imagePath)
                   let data = try? Data(contentsOf: url!)
                   if let imageData = data {
                       let image = UIImage(data: imageData)
                    self.image = image!
                   } else {
                    self.image = UIImage()
                    
        }
        
    }
}
