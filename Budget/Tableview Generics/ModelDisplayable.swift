//
//  ModelDisplayable.swift
//  Budget
//
//  Created by William Archimède on 16/08/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import Foundation

// Thanks Rajiv
protocol ModelDisplayable {
    associatedtype Model

    func prepareCell(with model: Model)
}
