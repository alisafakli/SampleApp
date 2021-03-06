//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Ali Safakli on 10/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import XCTest
@testable import SampleApp

class SampleAppTests: XCTestCase {
    
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
    
    func testUserList(){
        RestApiManager.shared.getUsers(onCompletion: { userModelArr in
            XCTAssert(userModelArr.count >= 0, "OK")
            
        })
    }
    
    func testPostList(){
        RestApiManager.shared.getPostsBy(userId: 1, onCompletion: { postModelArr in
            XCTAssert(postModelArr.count >= 0, "OK")
            
        })
    }
}
