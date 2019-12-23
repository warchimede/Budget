//
//  DateFormatter+Cache.swift
//  Budget
//
//  Created by William Archimède on 24/10/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation

extension DateFormatter {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    static func formattedString(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
