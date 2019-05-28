//
//  HomeInteractor.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 28/05/2019.
//  Copyright (c) 2019 Dmitrii Leksashov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic {
    func doSomething(request: Home.Something.Request)
}

protocol HomeDataStore {
    //var name: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    //var name: String = ""
    
    // MARK: Do something
    func doSomething(request: Home.Something.Request) {
        worker = HomeWorker()
        worker?.doSomeWork()
        
        let response = Home.Something.Response()
        presenter?.presentSomething(response: response)
    }
}