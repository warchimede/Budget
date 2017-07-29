//
//  BalanceRouter.swift
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

@objc protocol BalanceRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol BalanceDataPassing {
    var dataStore: BalanceDataStore? { get }
}

class BalanceRouter: NSObject, BalanceRoutingLogic, BalanceDataPassing {
    weak var viewController: BalanceViewController?
    var dataStore: BalanceDataStore?

    // MARK: Routing

    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") 
    //  as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}

    // MARK: Navigation

    //func navigateToSomewhere(source: BalanceViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}

    // MARK: Passing data

    //func passDataToSomewhere(source: BalanceDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
