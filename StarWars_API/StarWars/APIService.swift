//
//  AppDelegate.swift
//  StarWars
//
//  Created by Willis, David on 10/24/18.
//  Copyright © 2018 Willis, David. All rights reserved.
//

import Foundation
import UIKit

enum Result <T> {
    case Success(T)
    case Error(String)
}

class APIService: NSObject {
    
    let query = "films"
    lazy var endPoint: String = {
        return "https://swapi.co/api/\(self.query)"
    }()
    
    func getDataWith(completion: @escaping ( Result<[[String: AnyObject]]>) -> Void) {
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    
                    guard let itemsJsonArray = json["results"] as? [[String: AnyObject]] else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                        
                        let nc = NotificationCenter.default
                        nc.post(name: Notification.Name(rawValue: "DataUpdated"), object: nil)
                        
                    }
                    
                    
                } else {
                    return
                }
                
            } catch let error {
                print(error)
            }
            
            }.resume()
        
    }
    
    
    
} // end APIService class

class APIService2: NSObject {
    
    let query = "starships"
    lazy var endPoint: String = {
        return "https://swapi.co/api/\(self.query)"
    }()
    
    func getDataWith(completion: @escaping ( Result<[[String: AnyObject]]>) -> Void) {
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    
                    guard let itemsJsonArray = json["results"] as? [[String: AnyObject]] else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                        
                        let nc = NotificationCenter.default
                        nc.post(name: Notification.Name(rawValue: "DataUpdated"), object: nil)
                        
                    }
                    
                    
                } else {
                    return
                }
                
            } catch let error {
                print(error)
            }
            
            }.resume()
        
    }
    
    
    
} // end APIService class

class APIService3: NSObject {
    
    let query = "planets"
    lazy var endPoint: String = {
        return "https://swapi.co/api/\(self.query)"
    }()
    
    func getDataWith(completion: @escaping ( Result<[[String: AnyObject]]>) -> Void) {
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    
                    guard let itemsJsonArray = json["results"] as? [[String: AnyObject]] else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                        
                        let nc = NotificationCenter.default
                        nc.post(name: Notification.Name(rawValue: "DataUpdated"), object: nil)
                        
                    }
                    
                    
                } else {
                    return
                }
                
            } catch let error {
                print(error)
            }
            
            }.resume()
        
    }
    
    
    
} // end APIService class

class APIService4: NSObject {
    
    let query = "species"
    lazy var endPoint: String = {
        return "https://swapi.co/api/\(self.query)"
    }()
    
    func getDataWith(completion: @escaping ( Result<[[String: AnyObject]]>) -> Void) {
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    
                    guard let itemsJsonArray = json["results"] as? [[String: AnyObject]] else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                        
                        let nc = NotificationCenter.default
                        nc.post(name: Notification.Name(rawValue: "DataUpdated"), object: nil)
                        
                    }
                    
                    
                } else {
                    return
                }
                
            } catch let error {
                print(error)
            }
            
            }.resume()
        
    }
    
    
    
} // end APIService class

class APIService5: NSObject {
    
    let query = "people"
    lazy var endPoint: String = {
        return "https://swapi.co/api/\(self.query)"
    }()
    
    func getDataWith(completion: @escaping ( Result<[[String: AnyObject]]>) -> Void) {
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    
                    guard let itemsJsonArray = json["results"] as? [[String: AnyObject]] else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                        
                        let nc = NotificationCenter.default
                        nc.post(name: Notification.Name(rawValue: "DataUpdated"), object: nil)
                        
                    }
                    
                    
                } else {
                    return
                }
                
            } catch let error {
                print(error)
            }
            
            }.resume()
        
    }
    
    
    
} // end APIService class


