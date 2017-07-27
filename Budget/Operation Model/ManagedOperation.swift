//
//  OperationMO.swift
//  Budget
//
//  Created by William Archimède on 14/07/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit
import CoreData

class ManagedOperation: NSManagedObject {
    @NSManaged var amount: NSDecimalNumber?
    @NSManaged var date: NSDate?
    @NSManaged var title: String?

    func toOperation() -> Operation {
        return Operation(amount: amount! as Decimal, date: date! as Date, title: title!)
    }

    func from(operation: Operation) {
        amount = operation.amount as NSDecimalNumber
        date = operation.date as NSDate
        title = operation.title
    }
}
