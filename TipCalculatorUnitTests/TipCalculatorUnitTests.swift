//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by Kevin Wafula on 02/01/2024.
//

import XCTest

final class TipCalculatorUnitTests: XCTestCase {
    
    func test_should_calculate_tip_successfully() {
        let tipCalculator = TipCalculator()
        let tip = try!  tipCalculator.calculate(total: 100, tipPercentage: 0.1)
        
        XCTAssertEqual(10, tip)
    }
    
    func test_should_throw_invalid_input_exception() {
        let tipCalculator = TipCalculator()
        
        XCTAssertThrowsError(try tipCalculator.calculate(total: -100, tipPercentage: 0.1), "") {
            error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
        }
        
    }
}
