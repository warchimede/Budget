//
//  HistoryPresenter.swift
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

protocol HistoryPresentationLogic {
    func presentList(response: History.List.Response)
    func presentDeletion(response: History.Deletion.Response)
}

class HistoryPresenter: HistoryPresentationLogic {
    weak var viewController: HistoryDisplayLogic?

    // MARK: Present list of operations and amount

    func presentList(response: History.List.Response) {
        let viewModel = History.List.ViewModel(amount: "\(response.amount)", operations: response.operations)
        viewController?.displayList(viewModel: viewModel)
    }

    func presentDeletion(response: History.Deletion.Response) {
        let viewModel = History.Deletion.ViewModel(amount: "\(response.amount)", operation: response.operation)
        viewController?.displayDeletion(viewModel: viewModel)
    }
}
