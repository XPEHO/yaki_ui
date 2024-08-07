//
//  CollapsableCardTests.swift
//  XpehoUIUITests
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI
import XCTest
@testable import XpehoUI

import SnapshotTesting
import xpeho_ui

final class CollapsableCardTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait
        
        // Load fonts for snapshots
        Fonts.registerFonts()
    }

    // TODO: It seems that a behaviour doesn't have time to apply we need to delay the snapshot
    // Snapshot test (Like golden test in flutter)
    func testCollapsableCardSnapshot() {
        let viewController = CollapsableCardView().toViewController()

        viewController.view.frame = CGRect(x: 0, y: 0, width: 400, height: 1000)
        viewController.view.layoutIfNeeded()
        
        assertSnapshot(
            of: viewController,
            as: .image
        )
    }

    // Component test
    func testCollapsableCardCanBeCustomized() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to CollapsableCardView
        app.staticTexts["CollapsableCard"].tap()
        
        // Check if we have "CollapsableCard" as navigation title
        XCTAssertTrue(app.navigationBars["CollapsableCard"].exists)

        // Check if we have 5 CollapsableCard instances with different texts
        XCTAssertTrue(app.staticTexts["Collapsable Card"].exists)
        XCTAssertTrue(app.staticTexts["QVST Title"].exists)
        XCTAssertTrue(app.staticTexts["Newsletter #__"].exists)
        XCTAssertTrue(app.staticTexts["Birthday of NAME"].exists)
        XCTAssertTrue(app.staticTexts["Collapsable Card Customized"].exists)
        XCTAssertTrue(app.staticTexts["Collapsable Card Closed"].exists)
    }
}
