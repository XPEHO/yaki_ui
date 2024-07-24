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
        
        // Load custom fonts for snapshots
        let fontNames = ["Rubik-SemiBold.ttf"]
        for fontName in fontNames {
            registerFont(withFilenameString: fontName)
        }
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
