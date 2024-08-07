//
//  ChoiceSelectorTests.swift
//  XpehoUIUITests
//
//  Created by Ryan Debouvries on 24/07/2024.
//

import SwiftUI
import XCTest
@testable import XpehoUI

import SnapshotTesting
import xpeho_ui

final class ChoiceSelectorTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait
        
        // Load fonts for snapshots
        Fonts.registerFonts()
    }

    // Snapshot test (Like golden test in flutter)
    func testChoiceSelectorSnapshot() {
        let viewController = ChoiceSelectorView().toViewController()

        viewController.view.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        viewController.view.layoutIfNeeded()
        
        assertSnapshot(
            of: viewController,
            as: .image
        )
    }

    // Component test
    func testChoiceSelectorCanBeCustomized() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to ChoiceSelectorView
        app.staticTexts["ChoiceSelector"].tap()
        
        // Check if we have "ChoiceSelector" as navigation title
        XCTAssertTrue(app.navigationBars["ChoiceSelector"].exists)

        // Check if we have 3 ChoiceSelector instances with different texts
        XCTAssertTrue(app.staticTexts["Choice Selector"].exists)
        XCTAssertTrue(app.staticTexts["Choice Selector Customized"].exists)
    }

}
