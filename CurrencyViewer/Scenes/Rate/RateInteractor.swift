//
//  RateInteractor.swift
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

protocol RateBusinessLogic {
    func prepareRateInfo(request: Rate.Info.Request)
}

protocol RateDataStore {
    var selectedDate: Date? { get set }
}

class RateInteractor: RateBusinessLogic, RateDataStore {
    var presenter: RatePresentationLogic?
    var selectedDate: Date?
    
    func prepareRateInfo(request: Rate.Info.Request) {
        guard let date = selectedDate else {
            prepareError(text: "Дата не найдена")
            return
        }
        let stringDate = date.toString(with: .yearMonthDay)
        
        RateService.service.getArhiveRate(date: stringDate)
            .onSuccess { [weak self] model in
                if let err = model.error {
                    self?.prepareError(text: err)
                    return
                }
                
                guard let valute = model.valute else {
                    self?.prepareError(text: "Нет данных")
                    return
                }
             
                let response = Rate.Info.Response(
                    isRateInfoHidden: false,
                    date: date.toString(with: .dayMonthYear),
                    dollar: String(valute.dollar.value),
                    euro: String(valute.euro.value))
                self?.presenter?.presentRateInfo(response: response)
            }
            .onFailure { [weak self] error in
                self?.prepareError(text: error.description)
        }
    }
    
    private func prepareError(text: String) {
        let response = Rate.ErrorInfo.Response(
            text: text,
            isRateInfoHidden: true,
            isNoneLabelHidden: false)
        presenter?.presentRateError(response: response)
    }
}
