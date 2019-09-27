//
//  Jokes+CoreDataClass.swift
//  Exam3Project
//
//  Created by Sharan on 9/27/19.
//  Copyright © 2019 Sharan. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Jokes)
public class Jokes: NSManagedObject, Codable{
    public required init(from decoder: Decoder) throws{
        guard let description = NSEntityDescription.entity(forEntityName: "Jokes", in: CoreDataManager.shared.context) else { throw CoreDataError.invalidEntityDescription }
    }
    self.init(entity: description , insertInto: )
    
}

    
enum CoreDataError: Error {
    case invalidEntityDescription
}
