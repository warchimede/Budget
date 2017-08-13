//
//  CreateOperationViewController.swift
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

protocol CreateOperationDisplayLogic: class {
    func displayCreationDone()
}

class CreateOperationViewController: UIViewController, CreateOperationDisplayLogic {
    var interactor: CreateOperationBusinessLogic?

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
        let interactor = CreateOperationInteractor()
        let presenter = CreateOperationPresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Create operation

    @IBAction func createOperation(_ sender: Any) {
        let request = CreateOperation.Creation.Request(title: "test", amount: "10", isWithdrawal: true)
        interactor?.createOperation(request: request)
    }

    func displayCreationDone() {
        navigationController?.popViewController(animated: true)
    }
}
