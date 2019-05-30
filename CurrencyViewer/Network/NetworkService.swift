//
//  NetworkService.swift
//  CurrencyViewer
//
//  Created by Dmitrii Leksashov on 29/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation
import BrightFutures
import Alamofire

class NetworkService {
    func getModelResponse<T: Codable>(router: URLRequestConvertible) -> Future<T, NSError> {
        let promise = Promise<T, NSError>()
            request(router)
            .validate(statusCode: 200 ..< 500)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    guard let model = try? JSONDecoder().decode(T.self, from: data) else {
                       return promise.failure(AFError.responseSerializationFailed(reason: .inputDataNil) as NSError)
                    }
                    promise.success(model)
                case .failure(let error):
                    promise.failure(error as NSError)
                }
        }
        return promise.future
    }
}
