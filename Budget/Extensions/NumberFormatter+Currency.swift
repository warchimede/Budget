//
//  NumberFormatter+Currency.swift
//  Budget
//
//  Created by William Archimède on 19/10/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation

extension NumberFormatter {
    private static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .currency
        return formatter
    } ()

    static func formatToCurrency(with amount: Decimal) -> String? {
        return currencyFormatter.string(from: amount as NSNumber)
    }
}
