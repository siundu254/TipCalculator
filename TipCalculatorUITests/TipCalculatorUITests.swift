//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Kevin Wafula on 02/01/2024.
//

import XCTest

final class TipCalculatorUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }

    func test_should_make_sure_that_the_total_text_field_contains_default_value() {
        
        let totalTextField = app.textFields["totalTextField"]
        
        XCTAssertEqual(totalTextField.value as! String, "Enter Total")
        
    }
    
    func test_should_make_sure_the_20_percent_default_tip_option_is_selected() {
        
        let tipPercentageSegmentControl = app.segmentedControls["tipPercentageSegmentControl"]
        let segmentedControlButton = tipPercentageSegmentControl.buttons.element(boundBy: 1)
        
        XCTAssertEqual(segmentedControlButton.label, "20%")
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
    
    func test_should_make_sure_that_tip_is_displayed_on_the_screen() {
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
        
        let tipText = app.staticTexts["tipText"]
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(tipText.label, "")
    }
    
    func test_should_display_error_message_for_invalid_inout() {
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        let _ = messageText.waitForExistence(timeout: 1.0)
        
        XCTAssertEqual(messageText.label, "Invalid Input")
    }
}
