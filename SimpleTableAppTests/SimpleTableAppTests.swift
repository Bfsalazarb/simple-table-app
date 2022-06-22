//
//  SimpleTableAppTests.swift
//  SimpleTableAppTests
//
//  Created by Boris on 6/20/22.
//  Copyright © 2022 Boris. All rights reserved.
//

import XCTest
@testable import SimpleTableApp

class SimpleTableAppTests: XCTestCase {
    
    func test_GetDataFromAPI_NotValidURL_ShouldBeError(){
        let caller = DatatAPICaller()
        caller.GetDataFromApi(urlString: "notAValidURL") { (Result, Error) in
            XCTAssertNotNil(Error)
        }
    }
    
    func test_DataAPICaller_NotValidURL_ResultShouldBeNil(){
        let caller = DatatAPICaller()
        caller.GetDataFromApi(urlString: "notAValidURL") { (Result, Error) in
            XCTAssertNil(Result)
        }
    }
    
    func test_DataAPICaller_NotValidJSON_ResultShouldBeNil_ErrorShouldNotBeNil(){
        let caller = DatatAPICaller()
        caller.GetDataFromApi(urlString: "https://jsonplaceholder.typicode.com/todos/1") { (Result, Error) in
            XCTAssertNotNil(Error)
            XCTAssertNil(Result)
        }
    }
    
    func test_GetDataFromAPI_ValidURL_ResultShouldNotBeNil(){
        let caller = DatatAPICaller()
        caller.GetDataFromApi() { (Result, Error) in
            XCTAssertNotNil(Result)
        }
    }
    
    func test_DetailViewController_ConfigureView_ValuesShouldBeUpdated(){
        let view = DetailViewController()
        let title = "some title"
        let detail = "some description detail"
        let imageURL = "some URL"
        view.configure(title: title, detail: detail, imageURL: imageURL)
        XCTAssertEqual(view.titleLabelString , title)
        XCTAssertEqual(view.detailLabelString , detail)
        XCTAssertEqual(view.imageURL , imageURL)
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
