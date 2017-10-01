//
//  Color+Amount.swift
//  Budget
//
//  Created by William Archimède on 11/09/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func color(for amount: Decimal) -> UIColor {
        if amount > 0 {
            return #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else if amount == 0 {
            return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }

        return #colorLiteral(red: 1, green: 0.3568627451, blue: 0.3176470588, alpha: 1)
    }
}
