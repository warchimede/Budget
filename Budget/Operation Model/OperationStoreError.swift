//
//  OperationStoreError.swift
//  Budget
//
//  Created by William Archimède on 31/10/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation

enum OperationStoreError: Error {
    case cannotFetch(String)
    case cannotCreate(String)
    case cannotDelete(String)
}
