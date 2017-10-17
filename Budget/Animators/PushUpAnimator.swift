//
//  PushUpAnimator.swift
//  Budget
//
//  Created by William Archimède on 17/10/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import UIKit

class PushUpAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to)
            else {
                return
        }
        let containerFrame = transitionContext.containerView.frame
        let fromVCFinalFrame = CGRect(x: containerFrame.minX, y: containerFrame.minY - containerFrame.height, width: containerFrame.width, height: containerFrame.height)
        toVC.view.frame = CGRect(x: containerFrame.minX, y: containerFrame.maxY, width: containerFrame.width, height: containerFrame.height)
        transitionContext.containerView.addSubview(toVC.view)

        let animations = {
            fromVC.view.frame = fromVCFinalFrame
            toVC.view.frame = transitionContext.containerView.frame
        }

        let transitionDuration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: transitionDuration, delay: 0.0, options: .curveEaseInOut, animations: animations) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
