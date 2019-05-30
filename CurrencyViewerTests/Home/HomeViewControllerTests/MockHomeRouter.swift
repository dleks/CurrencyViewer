//
//  MockHomeRouter.swift
//  CurrencyViewerTests
//
//  Created by Dmitrii Leksashov on 30/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation

class MockHomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    var dataStore: HomeDataStore?
    var isRouteToScreen: Bool = false
  
    func routeToRateScreen() {
        isRouteToScreen = true
    }
}
