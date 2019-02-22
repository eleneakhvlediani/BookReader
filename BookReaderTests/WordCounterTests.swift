//
//  WordCounterTests.swift
//  BookReaderTests
//
//  Created by Elene Akhvlediani on 2/21/19.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import XCTest
@testable import BookReader

class WordCounterTests: XCTestCase {
    func testWordReader() {
        let fileReader = try! FileReader.makeFor(fileName: "Test")
        let wordCounter = WordCounter()
        let countedWords = wordCounter.countWords(in: fileReader)
        XCTAssertEqual(countedWords["test"]!, 3)
        XCTAssertEqual(countedWords["xcode"]!, 2)
        XCTAssertEqual(countedWords["the"]!, 2)
        XCTAssertEqual(countedWords["compare"]!, 2)
        XCTAssertEqual(countedWords["i'm"]!, 1)
        XCTAssertNil(countedWords["!"])
        XCTAssertEqual(countedWords.count, 8)
    }
    
    func testErrors() {
        XCTAssertThrowsError(try FileReader.makeFor(fileName: "NonExistingFile")) { error in
            XCTAssertEqual(error as! FileReader.Error, FileReader.Error.fileNotFound)
        }
    }
}

