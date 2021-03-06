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
    func prepareItems(request: Home.Items.Request)
    func prepareSelectedItem(request: Home.SelectedItem.Request)
    func prepareBatch(request: Home.Items.Request)
}

protocol HomeDataStore {
    var selectedDate: Date { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var selectedDate: Date = Date()
    var dates = [Date]()
    
    func prepareItems(request: Home.Items.Request) {
        updateDates(startIndex: 0, endIndex: Constants.batchOfDate)
    }
    
    func prepareSelectedItem(request: Home.SelectedItem.Request) {
        selectedDate = dates[request.index]
        let response = Home.SelectedItem.Response()
        presenter?.presentSelectedItem(response: response)
    }
    
    func prepareBatch(request: Home.Items.Request) {
        let lastIndex = dates.count - 1
        updateDates(startIndex: lastIndex, endIndex: lastIndex + Constants.batchOfDate)
    }
   
    private func updateDates(startIndex: Int, endIndex: Int) {
        for step in startIndex...endIndex {
            guard let newDate = Date().removal(value: step, component: .day) else {
                break
            }
            dates.append(newDate)
        }
        let stringDates = dates.map { $0.toString(with: .dayMonthYear) }
        let response = Home.Items.Response(dates: stringDates)
        presenter?.presentItems(response: response)
    }
}
