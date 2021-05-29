//
//  TagCategory+CoreDataClass.swift
//  Tagger
//
//  Created by David Willis on 11/29/18.
//  Copyright © 2018 David Willis. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TagCategory)
public class TagCategory: NSManagedObject {
    
    static func createTagCategoryEntityFrom(title: String) -> NSManagedObject? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        if let tagCategoryEntity = NSEntityDescription.insertNewObject(forEntityName: "TagCategory", into: context) as? TagCategory {
            
            tagCategoryEntity.title = title
            // ...
            // ...
            // ...
            
            return tagCategoryEntity
            
        }
        
        return nil
        
    }
    
    static func saveInCoreDataWith(title: String) {
        
        _ = self.createTagCategoryEntityFrom(title: title)
        
        // SAVE THE ENTITIES TO CORE DATA, USING THE CONTEXT
        do {
            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        }
        catch let error {
            print(error)
        }
        
    }
    
    static func getAllTagCategories() -> [NSManagedObject] {
        
        // STEP 1: GET A REFERENCE TO THE CORE DATA CONTEXT
        let managedContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        // STEP 2: CREATE A FETCH REQUEST FOR A SPECIFIC ENTITY
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TagCategory")
        
        // STEP 3: SORT THE OBJECTS
        let sort = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        // STEP 4: CREATE A COLLECTION (array) OF NSManagedObjects (TagCategory)
        var allTagCategories = [NSManagedObject]()
        
        // STEP 5: EXECUTE THE FETCH REQUEST
        do {
            let results = try managedContext.fetch(fetchRequest) // THE ACTUAL "QUERY"
            allTagCategories = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch tag categories \(error), \(error.userInfo)")
        }
        
        // STEP 6: RETURN THE ARRAY
        return allTagCategories
        
    }
    
}
