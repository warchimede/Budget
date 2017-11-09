//
//  AppDelegate+Shortcuts.swift
//  Budget
//
//  Created by William Archimède on 09/11/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit

extension AppDelegate {
    private enum ShortcutType: String {
        case balance
        case creation
        case history
    }

    func handle(_ shortcutItem: UIApplicationShortcutItem) {
        guard let type = ShortcutType(rawValue: shortcutItem.type) else {
            return
        }

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)

        switch type {
        case .history:
            let historyVC = storyBoard.instantiateViewController(withIdentifier: "HistoryViewController")
            navigationController?.pushViewController(historyVC, animated: false)
        case .creation:
            let creationVC = storyBoard.instantiateViewController(withIdentifier: "CreateOperationViewController")
            navigationController?.pushViewController(creationVC, animated: false)
        case .balance: ()
        }
    }
}
