//
//  Array+Operation.swift
//  Budget
//
//  Created by William Archimède on 13/08/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation

extension Array where Element == Operation {
    func total() -> Decimal {
        return self.reduce(0, { $0 + ($1.amount as Decimal) })
    }
}
