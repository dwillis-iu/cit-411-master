//
//  IKEAAllLocations.swift
//  IKEAFinder
//
//  Created by David Willis on 10/12/18.
//  Copyright © 2018 Willis, David James. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class IKEAAllLocations : UIViewController {
    
    var selectedIKEA: IKEA!
    var IKEABucket: IKEADataStore!
    let IKEABucket2 = IKEADataStore.init()
    
    @IBOutlet weak var mapWorldMap2: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var i = 0
        
        while i < IKEABucket2.allIKEAs.count {
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: IKEABucket2.allIKEAs[i].latitude, longitude: IKEABucket2.allIKEAs[i].longitude)
            mapWorldMap2.addAnnotation(annotation)
            
            i += 1
            
        }
        
            
    }
    
    
}
