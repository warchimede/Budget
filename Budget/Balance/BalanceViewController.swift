//
//  BalanceViewController.swift
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

protocol BalanceDisplayLogic: class {
    func displayAmount(viewModel: Balance.Amount.ViewModel)
}

class BalanceViewController: UIViewController {
    var interactor: BalanceBusinessLogic?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = BalanceInteractor()
        let presenter = BalancePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: View lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAmount()
    }

    // MARK: Display balance amount

    @IBOutlet weak var balanceButton: UIButton!

    func getAmount() {
        let request = Balance.Amount.Request()
        interactor?.getAmount(request: request)
    }
}

extension BalanceViewController: BalanceDisplayLogic {
    func displayAmount(viewModel: Balance.Amount.ViewModel) {
        balanceButton.setTitle(viewModel.amount, for: .normal)
    }
}
