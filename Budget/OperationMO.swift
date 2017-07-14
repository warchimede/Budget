//
//  OperationMO.swift
//  Budget
//
//  Created by William Archimède on 14/07/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit
import CoreData

class OperationMO: NSManagedObject {
    @NSManaged var amount: NSDecimalNumber?
    @NSManaged var date: NSDate?
    @NSManaged var title: String?
}
