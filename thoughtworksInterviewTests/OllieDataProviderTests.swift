//
//  OllieDataProviderTests.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/15/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import XCTest
@testable import thoughtworksInterview

class OllieDataProviderTests: XCTestCase {
    
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
    
    func testServiceDecider(){
        let tagTestString = "Ihavetag"
        let tagPositive = "categoryService"
        let tagsServiceString = "itagsus"
        let tagsPositive = "tagsService"
        let songsPositivestring = "ihavesongsinmyface"
        let songsPositive = "songsService"
        let negativeString = "pqpqpqpqpqpqpq"
        let ollieDataProvider = OllieDataProvider()
        XCTAssertEqual(ollieDataProvider.whichServiceGotCalled(serviceURL: tagTestString), tagPositive)
        XCTAssertEqual(ollieDataProvider.whichServiceGotCalled(serviceURL: tagsServiceString), tagsPositive)
        XCTAssertEqual(ollieDataProvider.whichServiceGotCalled(serviceURL: songsPositivestring), songsPositive)
        XCTAssertNotEqual(ollieDataProvider.whichServiceGotCalled(serviceURL: negativeString), tagsPositive)
    }
}
