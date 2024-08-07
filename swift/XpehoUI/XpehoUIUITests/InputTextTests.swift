//
//  InputTextTests.swift
//  XpehoUIUITests
//
//  Created by Ryan Debouvries on 05/08/2024.
//

import SwiftUI
import XCTest
@testable import XpehoUI

import SnapshotTesting
import xpeho_ui

final class InputTextTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait
        
        // Load fonts for snapshots
        Fonts.registerFonts()
    }

    // Snapshot test (Like golden test in flutter)
    func testInputTextSnapshot() {
        let viewController = InputTextView().toViewController()

        viewController.view.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        viewController.view.layoutIfNeeded()
            
        assertSnapshot(
            of: viewController,
            as: .image
        )
    }

    // Component test
    func testInputTextCanBeCustomized() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to InputTextView
        app.staticTexts["InputText"].tap()
        
        // Check if we have "InputText" as navigation title
        XCTAssertTrue(app.navigationBars["InputText"].exists)

        // Check if we have 7 InputText instances with different texts
        XCTAssertTrue(app.staticTexts["Input Text"].exists)
        XCTAssertTrue(app.staticTexts["Input Text Hiddenable"].exists)
        XCTAssertTrue(app.staticTexts["Input Text With Input"].exists)
        XCTAssertTrue(app.staticTexts["Input Text Hiddenable With Input"].exists)
        XCTAssertTrue(app.staticTexts["Input Text Customed"].exists)
        XCTAssertTrue(app.staticTexts["Input Text Customed With Input"].exists)
        XCTAssertTrue(app.staticTexts["Input Text Hiddenable Customed With Input"].exists)
    }
}
