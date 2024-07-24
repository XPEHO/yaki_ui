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
        
        // Load custom fonts for snapshots
        let fontNames = ["Rubik-SemiBold.ttf"]
        for fontName in fontNames {
            registerFont(withFilenameString: fontName)
        }
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
    
    // Load custom font
    func registerFont(withFilenameString filenameString: String) {
        guard let bundlePath = Bundle(for: type(of: self)).path(forResource: filenameString, ofType: nil),
            let fontData = NSData(contentsOfFile: bundlePath),
            let dataProvider = CGDataProvider(data: fontData),
            let fontRef = CGFont(dataProvider) else {
            fatalError("Failed to load font \(filenameString)")
        }

        var errorRef: Unmanaged<CFError>? = nil
        if CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) == false {
            print("Error registering font: maybe it's already registered.")
        }
    }

}
