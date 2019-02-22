//
//  BookReaderTests.swift
//  BookReaderTests
//
//  Created by Elene Akhvlediani on 2/20/19.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import XCTest
@testable import BookReader

class Int_ExtensionTests: XCTestCase {
    
    func testPrimes() {
        XCTAssertTrue(2.isPrime)
        XCTAssertTrue(3.isPrime)
        XCTAssertTrue(17.isPrime)
        XCTAssertTrue(47.isPrime)
        XCTAssertTrue(113.isPrime)
    }
    
    func testNonPrimes() {
        XCTAssertFalse(0.isPrime)
        XCTAssertFalse(1.isPrime)
        XCTAssertFalse(4.isPrime)
        XCTAssertFalse(8.isPrime)
        XCTAssertFalse(87.isPrime)
        XCTAssertFalse(237.isPrime)
    }
}
