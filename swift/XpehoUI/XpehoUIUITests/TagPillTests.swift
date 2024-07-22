//
//  TagPillTests.swift
//  XpehoUIUITests
//
//  Created by Ryan Debouvries on 22/07/2024.
//

import SwiftUI
import XCTest
@testable import XpehoUI

import SnapshotTesting

final class TagPillTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait
    }

    // Snapshot test (Like golden test in flutter)
    func testTagPillSnapshot() {
        assertSnapshot(
            of: TagPillView().toViewController(),
            as: .image
        )
    }

    // Component test
    func testTagPillCanBeCustomized() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to TagPillView
        app.staticTexts["TagPill"].tap()
        
        // Check if we have "TagPill" as navigation title
        XCTAssertTrue(app.navigationBars["TagPill"].exists)

        // Check if we have 3 TagPill instances with different texts
        XCTAssertTrue(app.staticTexts["Tag Pill"].exists)
        XCTAssertTrue(app.staticTexts["Tag Pill Customized"].exists)
        XCTAssertTrue(app.staticTexts["Tag Pill Important"].exists)
    }
}
