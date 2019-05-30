//
//  CurrencyModel.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation

struct CurrencyModel: Codable {
    
    let error: String?
    let date: String?
    let valute: CurrencyListModel?
    
    enum CodingKeys: String, CodingKey {
        case error
        case date = "Date"
        case valute = "Valute"
    }
}
