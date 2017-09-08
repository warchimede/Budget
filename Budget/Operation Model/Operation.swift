//
//  Operation.swift
//  Budget
//
//  Created by William Archimède on 27/07/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation

struct Operation {
    var amount: Decimal
    var date: Date
    var title: String
}

extension Operation: Equatable {
    static func ==(lhs: Operation, rhs: Operation) -> Bool {
        return lhs.amount == rhs.amount
            && lhs.date == rhs.date
            && lhs.title == rhs.title
    }
}
