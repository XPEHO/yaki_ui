//
//  FilePreviewButton.swift
//  XpehoUIUITests
//
//  Created by Ryan Debouvries on 23/07/2024.
//

import SwiftUI
import XCTest
@testable import XpehoUI

import SnapshotTesting
import xpeho_ui

final class FilePreviewButtonTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait

        // Load fonts for snapshots
        Fonts.registerFonts()
    }

    // Snapshot test (Like golden test in flutter)
    func testFilePreviewButtonSnapshot() {
        let viewController = FilePreviewButtonView().toViewController()

        viewController.view.frame = CGRect(x: 0, y: 0, width: 400, height: 900)
        viewController.view.layoutIfNeeded()
        
        assertSnapshot(
            of: viewController,
            as: .image
        )
    }

    // Component test
    func testFilePreviewButtonCanBeCustomized() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to FilePreviewButtonView
        app.staticTexts["FilePreviewButton"].tap()
        
        // Check if we have "FilePreviewButton" as navigation title
        XCTAssertTrue(app.navigationBars["FilePreviewButton"].exists)

        // Check if we have 3 FilePreviewButton instances with different texts
        XCTAssertTrue(app.staticTexts["File Preview Button"].exists)
        XCTAssertTrue(app.staticTexts["File Preview Button Customized"].exists)
        XCTAssertTrue(app.staticTexts["File Preview Button Disabled"].exists)
        
        // Check the disabled feature
        XCTAssertTrue(app.buttons["File Preview Button"].isEnabled, "The button should be enabled.")
        XCTAssertTrue(app.buttons["File Preview Button Customized"].isEnabled, "The button should be enabled.")
        XCTAssertFalse(app.buttons["File Preview Button Disabled"].isEnabled, "The button should be disabled.")
    }
}
