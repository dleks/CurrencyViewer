//
//  MockHomePresenter.swift
//  CurrencyViewerTests
//
//  Created by Dmitrii Leksashov on 30/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation

class MockHomePresenter: HomePresentationLogic {
    var isPresentItemsCall: Bool = false
    var isPresentSelectedItemCall: Bool = false
    
    func presentItems(response: Home.Items.Response) {
        isPresentItemsCall = true
    }
    
    func presentSelectedItem(response: Home.SelectedItem.Response) {
        isPresentSelectedItemCall = true
    }
}
