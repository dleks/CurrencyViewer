//
//  RatePresenter.swift
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

protocol RatePresentationLogic {
    func presentRateInfo(response: Rate.Info.Response)
    func presentRateError(response: Rate.ErrorInfo.Response)
}

class RatePresenter: RatePresentationLogic {
    weak var viewController: RateDisplayLogic?
    
    func presentRateInfo(response: Rate.Info.Response) {
        let viewModel = Rate.Info.ViewModel(
            isRateInfoHidden: response.isRateInfoHidden,
            date: response.date,
            dollar: response.dollar,
            euro: response.euro)
        viewController?.displayRateInfo(viewModel: viewModel)
    }
    
    func presentRateError(response: Rate.ErrorInfo.Response) {
        let viewModel = Rate.ErrorInfo.ViewModel(
            text: response.text,
            isRateInfoHidden: response.isRateInfoHidden,
            isNoneLabelHidden: response.isNoneLabelHidden)
        viewController?.displayNoneRate(viewModel: viewModel)
    }
}
