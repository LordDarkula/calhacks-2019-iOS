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
import MapKit

class ARViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    var sceneLocationView = SceneLocationView()
    var friendId: String = ""
    var clock = 0
    var distanceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.sceneLocationView.run()
        self.view.addSubview(self.sceneLocationView)
        
        distanceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        distanceLabel.center = CGPoint(x: 80, y: 20)
        distanceLabel.textAlignment = .center
        distanceLabel.text = "0.1m"
        self.view.addSubview(distanceLabel)
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
        }

    }
    
    func updatePath(current_lat: Double, current_long: Double, requested_lat: Double, requested_long: Double, bearing: Double) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: current_lat, longitude: current_long), addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: requested_lat, longitude: requested_long), addressDictionary: nil))
        request.requestsAlternateRoutes = false
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            let routes = unwrappedResponse.routes
            self.sceneLocationView.removeAllNodes()
            self.sceneLocationView.addRoutes(routes: routes)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        var parameters = [
            "current_user_id": UserDefaults.standard.string(forKey: "id"),
            "current_user_lat": String(locValue.latitude),
            "current_user_long": String(locValue.longitude),
            "requested_user_id": String(self.friendId)
        ]
        var url = "http://34.94.220.156/request_user_loc"
        JSONData.POSTData(parameters: parameters, url: url,completion: { data in (JSON).self
            let requested_lat = data["requested_user_lat"].double ?? locValue.latitude
            let requested_long = data["requested_user_long"].double ??  locValue.longitude
            let distance = data["dist"].double ?? 0.1
            print(distance)
            if distance < 1000.0 {
                self.distanceLabel.text = String(format: "%.2f", distance) + "m"
            }
            let bearing = data["bearing"].double ?? 120
            
            if self.clock % 10 == 0
            {
                self.updatePath(current_lat: locValue.latitude, current_long: locValue.longitude, requested_lat: requested_lat, requested_long: requested_long, bearing: bearing)
                self.clock = 0
            }
            
            self.clock += 1
        })
        
        
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
