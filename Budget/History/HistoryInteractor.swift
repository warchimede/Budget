//
//  HistoryInteractor.swift
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

protocol HistoryBusinessLogic
{
  func doSomething(request: History.Something.Request)
}

protocol HistoryDataStore
{
  //var name: String { get set }
}

class HistoryInteractor: HistoryBusinessLogic, HistoryDataStore
{
  var presenter: HistoryPresentationLogic?
  var worker: HistoryWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: History.Something.Request)
  {
    worker = HistoryWorker()
    worker?.doSomeWork()
    
    let response = History.Something.Response()
    presenter?.presentSomething(response: response)
  }
}