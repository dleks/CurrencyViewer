//
//  HomeViewControllerTest.swift
//  CurrencyViewerTests
//
//  Created by Dmitrii Leksashov on 30/05/2019.
//  Copyright © 2019 Dmitrii Leksashov. All rights reserved.
//

import UIKit
import XCTest
@testable
import CurrencyViewer

class HomeViewControllerTest: XCTestCase {
    var homeViewController: HomeViewController?
    var mockInteractor: MockHomeInteractor?
    var mockRouter: MockHomeRouter?
    override func setUp() {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle(for: self.classForCoder))
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        mockInteractor = MockHomeInteractor()
        mockRouter = MockHomeRouter()
        homeViewController?.interactor = mockInteractor
        homeViewController?.router = mockRouter 
    }
    
    override func tearDown() {
        homeViewController = nil
        mockInteractor = nil
        mockRouter = nil
    }
    
    func testThatHomeViewControllerExists() {
        XCTAssertNotNil(homeViewController, "a HomeViewController instance should be creatable from storyboard")
    }
    
    func testThatPrepareItemIsCalled() {
        _ = homeViewController?.view
        XCTAssert(mockInteractor?.isPrepareItemsCall ?? false, "preparareItems method not call")
    }
    
    func testThatTableViewExist() {
        _ = homeViewController?.view
        XCTAssertNotNil(homeViewController?.tableView, "tablueView is not created")
    }
    
    func testThatPrepareSelectedItemIsCalled() {
        _ = homeViewController?.view
        homeViewController?.tableView(homeViewController!.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssert(mockInteractor?.isPrepareSelectedItemCall ?? false, "preparareSelectedItem method not call")
    }
    
    func testThatRouteToScreen() {
        _ = homeViewController?.view
        homeViewController?.displayRateScreen(viewModel: Home.SelectedItem.ViewModel())
        XCTAssert(mockRouter?.isRouteToScreen ?? false, "preparareSelectedItem method not call")
    }
}
