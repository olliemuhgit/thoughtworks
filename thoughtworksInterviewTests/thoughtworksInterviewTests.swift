//
//  thoughtworksInterviewTests.swift
//  thoughtworksInterviewTests
//
//  Created by Andrew Oliver on 7/10/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import XCTest
@testable import thoughtworksInterview

class thoughtworksInterviewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNetworks(){
        let stringToTest = "http://totalmock.getsandbox.com/api/1/tags"
        
        
        XCTAssertEqual(OllieServiceConstants.getTagsUrl(), stringToTest)
    }
}
