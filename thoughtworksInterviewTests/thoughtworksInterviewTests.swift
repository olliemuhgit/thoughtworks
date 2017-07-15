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
    
    func testInitialService(){
        let stringToTest = "http://totalmock.getsandbox.com/api/1/tags"
        
        
        XCTAssertEqual(OllieServiceConstants.getTagsUrl(), stringToTest)
    }
    
    func testCategoryService(){
        let stringToTest = "http://totalmock.getsandbox.com/api/1/category/tag/2"
        
        XCTAssertEqual(OllieServiceConstants.getCategoryUrl(categoryID: 2), stringToTest)
        XCTAssertNotEqual(OllieServiceConstants.getCategoryUrl(categoryID: 43), stringToTest)
    }
    
    func testSongListURL(){
        let stringToTest = "http://totalmock.getsandbox.com/api/1/songs/multi?ids=1,2,3,4,5"
        
        XCTAssertEqual(OllieServiceConstants.getSongListURL(songIDListAsString: "1,2,3,4,5"), stringToTest)
        XCTAssertNotEqual(OllieServiceConstants.getSongListURL(songIDListAsString: "notGonnaDoIt"), stringToTest)
    }

}
