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

class CreateOperationViewController: UIViewController {
    var interactor: CreateOperationBusinessLogic?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var amountOkButton: UIButton!

    private var isDeposit = true
    private let defaultAmount = 10

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
        amountTextField.placeholder = "\(defaultAmount)"
        amountTextField.delegate = self
    }

    // MARK: Setup

    private func setup() {
        let interactor = CreateOperationInteractor()
        let presenter = CreateOperationPresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }

    @IBAction func onAmountOkButtonTapped(_ sender: Any) {
        amountTextField.resignFirstResponder()
        amountOkButton.isHidden = true
    }

    @IBAction func onSignButtonTapped(_ sender: Any) {
        isDeposit = !isDeposit
        let title = isDeposit ? "+" : "-"
        signButton.setTitle(title, for: .normal)
    }

    // MARK: Create operation

    @IBAction func createOperation(_ sender: Any) {
        let title = titleTextField.text
        let request = CreateOperation.Creation.Request(title: title, amount: amountTextField.text ?? "",
                                                        isDeposit: isDeposit)
        interactor?.createOperation(request: request)
    }
}

extension CreateOperationViewController: CreateOperationDisplayLogic {
    func displayCreationDone() {
        navigationController?.popViewController(animated: true)
    }
}

extension CreateOperationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        amountOkButton.isHidden = textField != amountTextField
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
