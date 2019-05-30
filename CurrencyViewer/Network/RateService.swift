//
//  RateService.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation
import BrightFutures
import Alamofire

class RateService: NetworkService {
    static let service = RateService()
    
    enum Router: URLRequestConvertible {
        case daily
        case archive(date: String)
        
        var encoding: ParameterEncoding {
            return URLEncoding()
        }
        
        var endpoint: Endpoints.Rate {
            switch self {
            case .daily:
                return .daily
            case .archive(let date):
                return .archive(date: date)
                
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try Constants.API.baseURL.asURL()
            let fullUrl = url.appendingPathComponent(endpoint.path)
            let urlRequest = try URLRequest(url: fullUrl, method: endpoint.method, headers: nil)
            return try encoding.encode(urlRequest, with: nil)
        }
    }
    
    func getDailyRate() -> Future<CurrencyModel, NSError> {
        return getModelResponse(router: Router.daily)
    }
    
    func getArhiveRate(date: String) -> Future<CurrencyModel, NSError> {
        return getModelResponse(router: Router.archive(date: date))
    }
}
