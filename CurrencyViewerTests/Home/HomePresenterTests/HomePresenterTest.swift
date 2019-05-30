//
//  HomePresenterTest.swift
//  CurrencyViewerTests
//
//  Created by Dmitrii Leksashov on 30/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import XCTest
@testable
import CurrencyViewer

class HomePresenterTest: XCTestCase {
    let presenter = HomePresenter()
    var mockViewController: MockHomeViewController?
    
    override func setUp() {
        mockViewController = MockHomeViewController()
        presenter.viewController = mockViewController
    }

    override func tearDown() {
        mockViewController = nil
    }

    func testThatDataReload() {
        presenter.presentItems(response: Home.Items.Response(dates: []))
        XCTAssert(mockViewController?.isReloadDataCalled ?? false, "reloadData method not call")
    }
    
    func testThatDisplayRateScreen() {
        presenter.presentSelectedItem(response: Home.SelectedItem.Response())
        XCTAssert(mockViewController?.isDisplayRateScreenCalled ?? false, "displayRateScreen method not call")
    }
}
