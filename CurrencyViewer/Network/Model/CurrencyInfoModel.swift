//
//  CurrencyInfoModel.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation

struct CurrencyInfoModel: Codable {
    let id: String
    let name: String
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case value = "Value"
    }
}
