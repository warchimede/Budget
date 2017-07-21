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
    //var name: String { get set }
}

class BalanceInteractor: BalanceBusinessLogic, BalanceDataStore {
    var presenter: BalancePresentationLogic?
    var worker: BalanceWorker?
    //var name: String = ""

    // MARK: Do something

    func getAmount(request: Balance.Amount.Request) {
        worker = BalanceWorker()
        worker?.doSomeWork()

        let response = Balance.Amount.Response(amount: 10)
        presenter?.presentSomething(response: response)
    }
}
