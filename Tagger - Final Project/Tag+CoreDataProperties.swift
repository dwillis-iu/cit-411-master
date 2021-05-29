//
//  Tag+CoreDataProperties.swift
//  Tagger
//
//  Created by David Willis on 11/29/18.
//  Copyright © 2018 David Willis. All rights reserved.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var title: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
