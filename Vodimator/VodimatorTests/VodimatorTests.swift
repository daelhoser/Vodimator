//
//  VodimatorTests.swift
//  VodimatorTests
//
//  Created by Darren Reely on 2/14/24.
//

import XCTest
@testable import Vodimator

final class VodimatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    func testSignInSuccess() async throws {
        print("testSignInSuccess() - begin")

        let a = AuthenticationController()
        a.user = secretUsername
        a.password = secretPassword
        a.url = ServerDetails().signInPath(name: a.user!, password: a.password!, server: secretServer)
        
        print("testSignInSuccess() - signInPathFeedback: \(a.url!)")
        
        let expectation = XCTestExpectation(description: "Sign In Expectation.")
        
        Task {
            await a.submitSignIn()
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 6)
        
        XCTAssert(a.authenticated == true, "FAILED SUCESSFULLY SIGN IN.")

        print("testSignInSuccess() - end.")
    }
    
    func testSignInFails() async throws {
        print("testSignInFails() - begin")

        let a = AuthenticationController()
        a.user = "someInvalidUserName"
        a.password = "someInvalidPasswordForTestingSignInFailer"
        a.url = ServerDetails().signInPath(name: a.user!, password: a.password!, server: secretServer)
        
        print("testSignInFails() - signInPathFeedback: \(a.url!)")
        print("testSignInFails() - a.authenticated BEFORE \(a.authenticated) - SHOULD BE FALSE")
        
        let expectation = XCTestExpectation(description: "Sign In Expectation.")
        
        Task {
            await a.submitSignIn()
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 6)

        print("testSignInFails() - a.authenticated AFTER \(a.authenticated) - SHOULD STILL BE FALSE")
        XCTAssert(a.authenticated == false, "FAILED to FAIL SIGN IN.")
        print("testSignInFails() - end")
   }
    
}
