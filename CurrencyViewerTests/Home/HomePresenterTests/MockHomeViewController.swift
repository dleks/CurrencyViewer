//
//  MockHomeViewController.swift
//  CurrencyViewerTests
//
//  Created by Dmitrii Leksashov on 30/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import Foundation

class MockHomeViewController: HomeDisplayLogic {
    var isReloadDataCalled: Bool = false
    var isDisplayRateScreenCalled: Bool = false
    
    func reloadData(viewModel: Home.Items.ViewModel) {
        isReloadDataCalled = true
    }
    
    func displayRateScreen(viewModel: Home.SelectedItem.ViewModel) {
        isDisplayRateScreenCalled = true
    }
}
