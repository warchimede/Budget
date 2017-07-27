//
//  BalancePresenter.swift
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

protocol BalancePresentationLogic {
    func presentAmount(response: Balance.Amount.Response)
}

class BalancePresenter: BalancePresentationLogic {
    weak var viewController: BalanceDisplayLogic?

    // MARK: Do something

    func presentAmount(response: Balance.Amount.Response) {
        let viewModel = Balance.Amount.ViewModel(amount: "\(response.amount)")
        viewController?.displayAmount(viewModel: viewModel)
    }
}
