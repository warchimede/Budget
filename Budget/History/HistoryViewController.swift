//
//  HistoryViewController.swift
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

protocol HistoryDisplayLogic: class {
    func displayList(viewModel: History.List.ViewModel)
}

class HistoryViewController: UIViewController {
    var interactor: HistoryBusinessLogic?

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
        let interactor = HistoryInteractor()
        let presenter = HistoryPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getList()
    }

    @IBOutlet weak var historyButton: UIButton!

    @IBAction func onHistoryButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBOutlet weak var operationsTableView: UITableView!

    let operationCellIdentifier = "OperationCell"
    var operationsTableViewDataSource: GenericTableViewDataSource<OperationCell>?

    fileprivate func setupTableView() {
        let bundle = Bundle(for: OperationCell.self)
        let nib = UINib(nibName: operationCellIdentifier, bundle: bundle)
        operationsTableView.register(nib, forCellReuseIdentifier: operationCellIdentifier)
        operationsTableView.estimatedRowHeight = 80.0
    }

    fileprivate func display(operations: [Operation]) {
        operationsTableViewDataSource = GenericTableViewDataSource<OperationCell>(with: operations, cellIdentifier: operationCellIdentifier)
        operationsTableView.dataSource = operationsTableViewDataSource
        operationsTableView.delegate = self
        operationsTableView.reloadData()
    }

    // MARK: Operations and amount

    fileprivate func getList() {
        let request = History.List.Request()
        interactor?.getList(request: request)
    }

    // MARK: Deletion

    fileprivate func deleteOperation(atIndex index: Int) {
        guard let operation = operationsTableViewDataSource?.models[index] else {
            return
        }

        let request = History.Deletion.Request(operation: operation)
        interactor?.deleteOperation(request: request)
    }

    fileprivate func deleteRowAction() -> UITableViewRowAction {
        return UITableViewRowAction(style: .destructive, title: "Delete") { action, indexPath in
            self.deleteOperation(atIndex: indexPath.row)
        }
    }
}

extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        return [deleteRowAction()]
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension HistoryViewController: HistoryDisplayLogic {
    func displayList(viewModel: History.List.ViewModel) {
        historyButton.setTitle(viewModel.amount, for: .normal)
        display(operations: viewModel.operations)
    }
}
