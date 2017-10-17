//
//  NavigationControllerDelegate.swift
//  Budget
//
//  Created by William Archimède on 17/10/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        switch operation {
        case .push where toVC is CreateOperationViewController:
            return PushDownAnimator()
        case .push where toVC is HistoryViewController:
            return PushUpAnimator()
        case .pop where fromVC is CreateOperationViewController:
            return PushUpAnimator()
        case .pop where fromVC is HistoryViewController:
            return PushDownAnimator()
        default:
            return nil
        }
    }
}
