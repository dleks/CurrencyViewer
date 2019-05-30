//
//  CurrencyListModel.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation

struct CurrencyListModel: Codable {
    let euro: CurrencyInfoModel
    let dollar: CurrencyInfoModel
    
    enum CodingKeys: String, CodingKey {
        case euro = "EUR"
        case dollar = "USD"
    }
}
