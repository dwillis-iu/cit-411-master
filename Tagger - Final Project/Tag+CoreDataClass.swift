//
//  Tag+CoreDataClass.swift
//  Tagger
//
//  Created by David Willis on 11/29/18.
//  Copyright © 2018 David Willis. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Tag)
public class Tag: NSManagedObject {
    
    static func createTagEntityFrom(title: String, longitude: Double, latitude: Double) -> NSManagedObject? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        if let tagEntity = NSEntityDescription.insertNewObject(forEntityName: "Tag", into: context) as? Tag {
            
            tagEntity.title = title
            tagEntity.longitude = longitude
            tagEntity.latitude = latitude
            // ...
            // ...
            // ...
            
            return tagEntity
            
        }
        
        return nil
        
    }
    
    static func saveInCoreDataWith(title: String, longitude: Double, latitude: Double) -> NSManagedObject {
        
        let tag = self.createTagEntityFrom(title: title, longitude: longitude, latitude: latitude)
        
        // SAVE THE ENTITIES TO CORE DATA, USING THE CONTEXT
        do {
            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        }
        catch let error {
            print(error)
        }
        
        return tag!
        
    }
    
    static func getAllTags() -> [NSManagedObject] {
        
        // STEP 1: GET A REFERENCE TO THE CORE DATA CONTEXT
        let managedContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        // STEP 2: CREATE A FETCH REQUEST FOR A SPECIFIC ENTITY
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tag")
        
        // STEP 3: SORT THE OBJECTS
        let sort = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        // STEP 4: CREATE A COLLECTION (array) OF NSManagedObjects (Tag)
        var allTags = [NSManagedObject]()
        
        // STEP 5: EXECUTE THE FETCH REQUEST
        do {
            let results = try managedContext.fetch(fetchRequest) // THE ACTUAL "QUERY"
            allTags = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch tags \(error), \(error.userInfo)")
        }
        
        // STEP 6: RETURN THE ARRAY
        return allTags
        
    }
}
