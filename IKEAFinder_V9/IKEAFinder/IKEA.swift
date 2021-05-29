//
//  IKEA.swift
//  IKEAFinder
//
//  Created by Willis, David James on 9/24/18.
//  Copyright © 2018 Willis, David James. All rights reserved.
//

import Foundation
import MapKit

//: Playground - noun: a place where people can play

//import Cocoa

//var str = "Hello, playground"

class IKEA: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    var storeName: String
    var storeNumber: NSDecimalNumber
    var storeImage: String
    var address: String
    var city: String
    var zipCode: String
    var country: String
    var telephone: String
    var size: NSDecimalNumber
    var roomSettings: NSDecimalNumber
    var realLifeHomes: NSDecimalNumber
    var cashLanes: NSDecimalNumber
    var restaurantSeating: NSDecimalNumber
    var smaland: Bool
    var webpage: String
    var latitude: Double
    var longitude: Double
    
    init(storeName: String, storeNumber: NSDecimalNumber, storeImage: String, address: String, city: String, zipCode: String, country: String, telephone: String, size: NSDecimalNumber, roomSettings: NSDecimalNumber, realLifeHomes: NSDecimalNumber, cashLanes: NSDecimalNumber, restaurantSeating: NSDecimalNumber, smaland: Bool, webpage: String, latitude: Double, longitude: Double) {
        self.storeName = storeName
        self.storeNumber = storeNumber
        self.storeImage = storeImage
        self.address = address
        self.city = city
        self.zipCode = zipCode
        self.country = country
        self.telephone = telephone
        self.size = size
        self.roomSettings = roomSettings
        self.realLifeHomes = realLifeHomes
        self.cashLanes = cashLanes
        self.restaurantSeating = restaurantSeating
        self.smaland = smaland
        self.webpage = webpage
        self.latitude = latitude
        self.longitude = longitude
    }
}

/*
let cardiff = IKEA(storeName: "Cardiff",
                   storeNumber: 267,
                   storeImage: "ikea_cardiff",
                   address: "Ferry Road (Grangetown)",
                   city: "Cardiff",
                   zipCode: "CF11 0XR",
                   country: "United Kingdom",
                   telephone: "442920729700",
                   size: 25950,
                   roomSettings: 49,
                   realLifeHomes: 3,
                   cashLanes: 0,
                   restaurantSeating: 410,
                   smaland: true,
                   webpage: "http://www.ikea.com/gb/en/store/cardiff",
                   latitude: 51.462752,
                   longitude: -3.188809)

print("\(cardiff.storeName)")
print("\(cardiff.storeNumber)")
print("\(cardiff.storeImage)")
print("\(cardiff.address)")
print("\(cardiff.city)")
print("\(cardiff.zipCode)")
print("\(cardiff.country)")
print("\(cardiff.telephone)")
print("\(cardiff.size)")
print("\(cardiff.roomSettings)")
print("\(cardiff.realLifeHomes)")
print("\(cardiff.cashLanes)")
print("\(cardiff.restaurantSeating)")
print("\(cardiff.smaland)")
print("\(cardiff.webpage)")
print("\(cardiff.latitude)")
print("\(cardiff.longitude)")
 */

