//
//  OperationWorker.swift
//  Budget
//
//  Created by William Archimède on 27/07/2017.
//  Copyright (c) 2017 William Archimede. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class OperationsWorker {
    var operationsStore: OperationsStoreProtocol

    init(operationsStore: OperationsStoreProtocol) {
        self.operationsStore = operationsStore
    }

    func fetchOperations() -> [Operation] {
        let (operations, error) = operationsStore.fetchOperations()

        if error == nil {
            return []
        }

        return operations
    }

    func create(_ operation: Operation, completion: @escaping (OperationsStoreError?) -> Void) {
        operationsStore.create(operation, completion: completion)
    }
}

protocol OperationsStoreProtocol {
    func fetchOperations() -> (operations: [Operation], error: OperationsStoreError?)
    func create(_ operation: Operation, completion: @escaping (OperationsStoreError?) -> Void)
}

enum OperationsStoreError: Error {
    case cannotFetch(String)
    case cannotCreate(String)
}
