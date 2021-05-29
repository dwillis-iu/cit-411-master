//
//  TagCategory+CoreDataProperties.swift
//  Tagger
//
//  Created by David Willis on 11/29/18.
//  Copyright © 2018 David Willis. All rights reserved.
//
//

import Foundation
import CoreData


extension TagCategory {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TagCategory> {
        return NSFetchRequest<TagCategory>(entityName: "TagCategory")
    }
    
    @NSManaged public var title: String?
    
}
