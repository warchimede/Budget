//
//  OperationStoreProtocol.swift
//  Budget
//
//  Created by William Archimède on 31/10/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation

protocol OperationStoreProtocol {
    func fetchAll(completion: @escaping ([Operation]?, OperationStoreError?) -> Void)
    func create(_ operation: Operation, completion: @escaping (OperationStoreError?) -> Void)
    func delete(_ operation: Operation, completion: @escaping (OperationStoreError?) -> Void)
}
