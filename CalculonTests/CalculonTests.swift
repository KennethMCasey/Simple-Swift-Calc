//
//  CalculonTests.swift
//  CalculonTests
//
//  Created by David Gerstl on 2/14/19.
//  Copyright © 2019 Farmingdale State College. All rights reserved.
//

import XCTest
@testable import Calculon

class CalculonTests: XCTestCase {
    let myModel = CalculatorModel()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOne() {
        XCTAssertTrue(myModel.numberToDisplay == "0.0")
        XCTAssertTrue(myModel.previousNumber == 0.0)
        myModel.numberPressed(number: 3)
        XCTAssertTrue(myModel.numberToDisplay == "3")
        XCTAssertTrue(myModel.previousNumber == 0.0)
        myModel.operationPressed(operation: .plus)
        XCTAssert(myModel.numberToDisplay == "3", "numberToDisplay should be '3' but is '\(myModel.numberToDisplay ?? "")'")
        XCTAssertTrue(myModel.numberToDisplay == "3")
        XCTAssertTrue(myModel.previousNumber == 3)
        myModel.numberPressed(number: 5)
        XCTAssertTrue(myModel.numberToDisplay == "5")
        XCTAssertTrue(myModel.previousNumber == 3)
        myModel.numberPressed(number: 2)
        XCTAssertTrue(myModel.numberToDisplay == "52")
        XCTAssertTrue(myModel.previousNumber == 3)
        myModel.operationPressed(operation: .minus)
        XCTAssert(myModel.numberToDisplay == "55", "numberToDisplay should be '55' but is '\(myModel.numberToDisplay ?? "")'")
        XCTAssertTrue(myModel.previousNumber == 55)
        myModel.numberPressed(number: 9)
        XCTAssertTrue(myModel.numberToDisplay ==  "9")
        XCTAssertTrue(myModel.previousNumber == 55)
        myModel.operationPressed(operation: .equals)
        XCTAssertTrue(myModel.numberToDisplay == "46")
        XCTAssertTrue(myModel.previousNumber == 46)
        myModel.operationPressed(operation: .plus)
        XCTAssertTrue(myModel.numberToDisplay == "46")
        XCTAssertTrue(myModel.previousNumber == 46)
        myModel.numberPressed(number: 2)
        XCTAssertTrue(myModel.numberToDisplay ==  "2")
        XCTAssertTrue(myModel.previousNumber == 46)
        myModel.operationPressed(operation: .equals)
        XCTAssertTrue(myModel.numberToDisplay == "48")
        XCTAssertTrue(myModel.previousNumber == 48)
        myModel.operationPressed(operation: .equals)
        XCTAssertTrue(myModel.numberToDisplay == "48")
        XCTAssertTrue(myModel.previousNumber == 48)
        myModel.clear()
        XCTAssertTrue(myModel.numberToDisplay == "0.0")
        XCTAssertTrue(myModel.previousNumber == 0.0)
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
