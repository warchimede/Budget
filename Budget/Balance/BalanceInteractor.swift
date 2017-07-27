//
//  BalanceInteractor.swift
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

protocol BalanceBusinessLogic {
    func getAmount(request: Balance.Amount.Request)
}

protocol BalanceDataStore {
}

class BalanceInteractor: BalanceBusinessLogic, BalanceDataStore {
    var presenter: BalancePresentationLogic?
    var operationsWorker = OperationsWorker(operationsStore: OperationsCoreDataStore())

    // MARK: Compute balance amount

    func getAmount(request: Balance.Amount.Request) {
        let amount = operationsWorker.fetchOperations().reduce(0, { $0 + ($1.amount as Decimal) })

        let response = Balance.Amount.Response(amount: amount)
        presenter?.presentAmount(response: response)
    }
}
