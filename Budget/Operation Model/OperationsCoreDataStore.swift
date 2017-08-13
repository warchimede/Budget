//
//  DataPersistenceManager.swift
//  Budget
//
//  Created by William Archimède on 14/07/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation
import CoreData

class OperationsCoreDataStore {

    fileprivate var persistentContainer: NSPersistentContainer

    init(persistentContainer: NSPersistentContainer? = nil) {
        if let persistentContainer = persistentContainer {
            self.persistentContainer = persistentContainer
        } else {
            /*
             The persistent container for the application. This implementation
             creates and returns a container, having loaded the store for the
             application to it. This property is optional since there are legitimate
             error conditions that could cause the creation of the store to fail.
             */
            self.persistentContainer = NSPersistentContainer(name: "Budget")
        }

        self.persistentContainer.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. 
                // You should not use this function in a shipping application, 
                // although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection 
                   when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    deinit {
        do {
            try save()
        } catch {
            fatalError("Error deinitializing OperationsCoreDataStore")
        }
    }

    func save() throws {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try context.save()
        }
    }
}

// Performing background tasks gives this object responsibilty to come back on main queue.
extension OperationsCoreDataStore: OperationsStoreProtocol {

    func fetchAll(completion: @escaping ([Operation]?, OperationsStoreError?) -> Void) {
        persistentContainer.performBackgroundTask { context in
            do {
                let request = NSFetchRequest<ManagedOperation>(entityName: "Operation")
                let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
                request.sortDescriptors = [sortDescriptor]
                let results = try context.fetch(request)
                let operations = results.map({ $0.toOperation() })
                DispatchQueue.main.async {
                    completion(operations, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, .cannotFetch("Cannont fetch operations"))
                }
            }
        }
    }

    func create(_ operation: Operation, completion: @escaping (OperationsStoreError?) -> Void) {
        persistentContainer.performBackgroundTask { context in
            do {
                let managedOperation = NSEntityDescription.insertNewObject(forEntityName: "Operation", into: context) as! ManagedOperation
                managedOperation.from(operation)
                try context.save()
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(OperationsStoreError.cannotCreate("Cannot create this operation."))
                }
            }
        }
    }
}
