//
//  CreateOperationInteractor.swift
//  Budget
//
//  Created by William Archimède on 29/07/2017.
//  Copyright (c) 2017 William Archimede. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CreateOperationBusinessLogic {
    func createOperation(request: CreateOperation.Creation.Request)
}

class CreateOperationInteractor: CreateOperationBusinessLogic {
    var presenter: CreateOperationPresentationLogic?
    var operationWorker: OperationWorker?

    // MARK: Create operation

    func createOperation(request: CreateOperation.Creation.Request) {
        guard let title = request.title,
            let amount = Decimal(string: request.amount, locale: .current).flatMap({ request.isDeposit ? $0 : -$0 })
        else {
            presenter?.presentCreationDone()
            return
        }

        let operation = Operation(amount: amount, date: Date(), title: title)
        operationWorker = OperationWorker(operationStore: OperationCoreDataStore())
        operationWorker?.create(operation) { [weak self] _ in
            self?.presenter?.presentCreationDone()
        }
    }
}
