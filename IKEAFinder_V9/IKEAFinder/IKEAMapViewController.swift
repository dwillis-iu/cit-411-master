//
//  IKEAMapViewController.swift
//  IKEAFinder
//
//  Created by David Willis on 10/2/18.
//  Copyright © 2018 Willis, David James. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class IKEAMapViewController : UIViewController, CLLocationManagerDelegate {
    
    var selectedIKEA: IKEA!
    var locationManager: CLLocationManager! // The exclamation point means it cannot be empty
    
    @IBOutlet weak var mapWorldMap: MKMapView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // CREATE AN OBJECT OF CLLOCATIONMANAGER
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // SHOW THE USER LOCATION ON THE MAP
        mapWorldMap.showsUserLocation = true
        
    }
    
    // CLLocationManager DELEGATE FUNCTIONS
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // ONCE WE FIGURE OUT WHERE THE USER IS...  UPDATE THE MAP TO SHOW THE LOCATION
        
        //centerMapOnLocation(locationCoord: selectedIKEA.coordinate, distance: 5000)
        
        // CALCULATE CENTER POINT
        
        let centerPoint = calculateCenterPoint(location1: locations.last!.coordinate, location2: selectedIKEA.coordinate)
        
        // CALCULATE REGION SIZE
        
        let regionSize = calculateRegionSize(location1: locations.last!.coordinate, location2: selectedIKEA.coordinate)
        
        
        // MOVE AND ZOOM THE MAP
        centerMapOnLocation(locationCoord: centerPoint, distance: regionSize)
        
        mapWorldMap.addAnnotation(selectedIKEA)

    }
    
    // INTERNAL FUNCTIONS
    
    // THIS FUNCTION MOVES AND CENTERS THE MAP
    
    func centerMapOnLocation(locationCoord: CLLocationCoordinate2D, distance: Double) {
        
        let mappedRegion = MKCoordinateRegionMakeWithDistance(locationCoord, distance, distance)
        
        mapWorldMap.setRegion(mappedRegion, animated: true)
        
    }
    
    // CALCULATE THE CENTER COORDINATES BETWEEN TWO GIVE COORDINATES
    func calculateCenterPoint(location1: CLLocationCoordinate2D, location2: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        
        let lon1: Double = location1.longitude * Double.pi / 180;
        let lon2: Double = location2.longitude * Double.pi / 180;
        
        let lat1: Double = location1.latitude * Double.pi / 180;
        let lat2: Double = location2.latitude * Double.pi / 180;
        
        let dLon: Double = lon2 - lon1;
        
        let x: Double = cos(lat2) * cos(dLon);
        let y: Double = cos(lat2) * sin(dLon);
        
        var lat3: Double = atan2( sin(lat1) + sin(lat2), sqrt((cos(lat1) + x) * (cos(lat1) + x) + y * y) );
        var lon3: Double = lon1 + atan2(y, cos(lat1) + x);
        
        lat3  = lat3 * 180 / Double.pi;
        lon3 = lon3 * 180 / Double.pi;
        
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat3, lon3)
        
        return center;
    }
    
    func calculateRegionSize(location1: CLLocationCoordinate2D, location2: CLLocationCoordinate2D) -> Double {
        
        // CREATE CLLOCATION OBJECTS
        let regionLocation1: CLLocation = CLLocation(latitude: location1.latitude, longitude: location1.longitude)
        
        let regionLocation2: CLLocation = CLLocation(latitude: location2.latitude, longitude: location2.longitude)
        
        // USE THE BUILT-IN METHOD TO GET THE DISTANCE BETWEEN THEM
        
        let distanceInMeters: CLLocationDistance = regionLocation1.distance(from: regionLocation2)
        
        return distanceInMeters
        
    }
    
    
}
