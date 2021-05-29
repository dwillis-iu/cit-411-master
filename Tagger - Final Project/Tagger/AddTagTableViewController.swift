//
//  AddTagTableViewController.swift
//  Tagger
//
//  Created by David Willis on 11/29/18.
//  Copyright © 2018 David Willis. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AddTagTableViewController: UITableViewController {
    
    var selectedTagCategory: TagCategory!
    
    var locManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
        
    @IBAction func btnCancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    @IBOutlet weak var tagTitleText: UITextField!
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
    
    // Get current latitude and longitude - Current Location
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.requestAlwaysAuthorization()
        locManager.startUpdatingLocation()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            guard let currentLocation = locManager.location else {
                return
            }
            
            latitude.text = String(currentLocation.coordinate.latitude)
            longitude.text = String(currentLocation.coordinate.longitude)
        }
    }
    
}
