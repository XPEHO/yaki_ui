//
//  ClickyButtonTests.swift
//  XpehoUIUITests
//
//  Created by Ryan Debouvries on 19/07/2024.
//

import SwiftUI
import XCTest
@testable import XpehoUI

import SnapshotTesting

final class ClickyButtonTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait
    }
    
    // Snapshot test (Like golden test in flutter)
    func testClickyButtonSnapshot() {
        assertSnapshot(
            of: ClickyButtonView().toViewController(),
            as: .image
        )
    }

    // Component test
    func testClickyButtonCanBeCustomized() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to ClickyButtonView
        app.staticTexts["ClickyButton"].tap()
        
        // Check if we have "ClickyButton" as navigation title
        XCTAssertTrue(app.navigationBars["ClickyButton"].exists)

        // Check if we have 3 ClickyButton instances with different texts
        XCTAssertTrue(app.buttons["Clicky Button"].exists)
        XCTAssertTrue(app.buttons["Clicky Button Customized"].exists)
        XCTAssertTrue(app.buttons["Clicky Button Disabled"].exists)
        
        // Check the disabled feature
        XCTAssertTrue(app.buttons["Clicky Button"].isEnabled, "The button should be enabled.")
        XCTAssertTrue(app.buttons["Clicky Button Customized"].isEnabled, "The button should be enabled.")
        XCTAssertFalse(app.buttons["Clicky Button Disabled"].isEnabled, "The button should be disabled.")        
    }
}

// Converter to view vontroller for snapshot testing
extension View {
    func toViewController() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
