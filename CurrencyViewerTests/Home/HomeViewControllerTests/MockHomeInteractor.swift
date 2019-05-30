//
//  MockHomeInteractor.swift
//  CurrencyViewerTests
//
//  Created by Dmitrii Leksashov on 30/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation

class MockHomeInteractor: HomeBusinessLogic {
    var isPrepareItemsCall: Bool = false
    var isPrepareSelectedItemCall: Bool = false
    
    func prepareItems(request: Home.Items.Request) {
        isPrepareItemsCall = true
    }
    
    func prepareSelectedItem(request: Home.SelectedItem.Request) {
        isPrepareSelectedItemCall = true
    }
}
