//
//  NumberFormatter+Currency.swift
//  Budget
//
//  Created by William Archimède on 19/10/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static func formatToCurrency(with amount: Decimal) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .currency

        return formatter.string(from: amount as NSNumber)
    }
}
