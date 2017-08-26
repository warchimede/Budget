//
//  GenericTableViewDataSource.swift
//  Budget
//
//  Created by William Archimède on 16/08/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit

// Thanks Rajiv
class GenericTableViewDataSource<Cell: UITableViewCell>: NSObject, UITableViewDataSource where Cell: ModelDisplayable {
    let models: [Cell.Model]
    let cellIdentifier: String

    init(with models: [Cell.Model], cellIdentifier: String) {
        self.models = models
        self.cellIdentifier = cellIdentifier

        super.init()
    }

    // MARK: UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Cell else {
            return UITableViewCell()
        }

        let model = models[indexPath.row]
        cell.prepareCell(with: model)

        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
