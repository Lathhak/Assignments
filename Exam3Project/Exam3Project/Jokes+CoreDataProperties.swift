//
//  Jokes+CoreDataProperties.swift
//  Exam3Project
//
//  Created by Sharan on 9/27/19.
//  Copyright © 2019 Sharan. All rights reserved.
//
//

import Foundation
import CoreData


extension Jokes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Jokes> {
        return NSFetchRequest<Jokes>(entityName: "Jokes")
    }

    @NSManaged public var category: String?
    @NSManaged public var type: String?
    @NSManaged public var setup: String?
    @NSManaged public var delivery: String?
    @NSManaged public var id: Int64

}
