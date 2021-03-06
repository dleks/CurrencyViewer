//
//  RateModels.swift
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

enum Rate {
    enum Info {
        struct Request { }
        struct Response {
            var isRateInfoHidden: Bool
            var date: String?
            var dollar: String?
            var euro: String?
        }
        struct ViewModel {
            var isRateInfoHidden: Bool
            var date: String?
            var dollar: String?
            var euro: String?
        }
    }
    enum ErrorInfo {
        struct Request { }
        struct Response {
            var text: String
            var isRateInfoHidden: Bool
            var isNoneLabelHidden: Bool
        }
        struct ViewModel {
            var text: String
            var isRateInfoHidden: Bool
            var isNoneLabelHidden: Bool
        }
    }
}
