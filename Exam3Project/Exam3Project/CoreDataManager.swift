//
//  CoreDataManager.swift
//  Exam3Project
//
//  Created by Sharan on 9/27/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JokesModel")
        container.loadPersistentStores { (description, error) in
            print(description)
            print(error)
        }
        return container
    }()
    var context: NSManagedObjectContext{
        return container.viewContext
    }

func save(){
    guard context.hasChanges else {return}
    try? context.save()
    }
    
func Core
}
