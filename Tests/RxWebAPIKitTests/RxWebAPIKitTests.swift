//
//  RxWebAPIKitTests.swift
//  RxWebAPIKit
//
//  Created by Evan Liu on {TODAY}.
//  Copyright © 2017 RxWebAPIKit. All rights reserved.
//

import Foundation
import XCTest
import RxWebAPIKit

class RxWebAPIKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(RxWebAPIKit().text, "Hello, World!")
    }
}

#if os(Linux)
extension RxWebAPIKitTests {
    static var allTests : [(String, (RxWebAPIKitTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
#endif
