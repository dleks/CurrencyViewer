//
//  Endpoints.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation
import Alamofire

struct Endpoints {
    enum Rate {
        case daily
        case archive(date: String)
        
        var path: String {
            switch self {
            case .daily:
                return "daily_json.js"
            case .archive(let date):
                return "archive/\(date)/daily_json.js"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            default:
                return .get
            }
        }
    }
}
