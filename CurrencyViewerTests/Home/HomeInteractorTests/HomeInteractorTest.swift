//
//  HomeInteractorTest.swift
//  CurrencyViewerTests
//
//  Created by Dmitrii Leksashov on 30/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import XCTest
@testable
import CurrencyViewer

class HomeInteractorTest: XCTestCase {
    let homeInteractor = HomeInteractor()
    var mockPresenter: MockHomePresenter?
    
    override func setUp() {
        mockPresenter = MockHomePresenter()
        homeInteractor.presenter = mockPresenter
    }

    override func tearDown() {
        mockPresenter = nil
    }

    func testThatPresentItemsIsCall() {
        homeInteractor.prepareItems(request: Home.Items.Request())
        XCTAssert(mockPresenter?.isPresentItemsCall ?? false, "preparareSelectedItem method not call")
    }
    
    func testThatPresentSelectedItemCallsCall() {
        homeInteractor.dates.append(Date())
        homeInteractor.prepareSelectedItem(request: Home.SelectedItem.Request(index: 0))
        XCTAssert(mockPresenter?.isPresentSelectedItemCall ?? false, "preparareSelectedItem method not call")
    }

}
