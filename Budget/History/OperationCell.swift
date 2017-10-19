//
//  OperationCell.swift
//  Budget
//
//  Created by William Archimède on 16/08/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit

class OperationCell: UITableViewCell, ModelDisplayable {
    typealias Model = Operation

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!

    func prepareCell(with model: Operation) {
        titleLabel.text = model.title
        dateLabel.text = "\(model.date)"
        amountLabel.text = NumberFormatter.formatToCurrency(with: model.amount) ?? "\(model.amount)"

        backgroundColor = UIColor.color(for: model.amount)
    }
}
