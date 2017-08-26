//
//  HistoryModels.swift
//  Budget
//
//  Created by William Archimède on 13/08/2017.
//  Copyright (c) 2017 William Archimede. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum History {
    // MARK: Use cases

    enum List {
        struct Request {
        }
        struct Response {
            let amount: Decimal
            let operations: [Operation]
        }
        struct ViewModel {
            let amount: String
            let operations: [Operation]
        }
    }

    enum Deletion {
        struct Request {
            let operation: Operation
        }

        // List models are used for the Response and ViewModel
    }
}
