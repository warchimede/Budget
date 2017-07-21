//
//  BalanceModels.swift
//  Budget
//
//  Created by William Archimède on 20/07/2017.
//  Copyright (c) 2017 William Archimede. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Balance {
    // MARK: Use cases

    enum Amount {
        struct Request {
        }
        struct Response {
            let amount: Decimal

        }
        struct ViewModel {
            let amount: String
        }
    }
}
