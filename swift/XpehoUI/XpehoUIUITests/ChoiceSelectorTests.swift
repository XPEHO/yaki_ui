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

final class ChoiceSelectorTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait
        
        // Load custom fonts for snapshots
        let fontNames = ["Raleway-Regular.ttf"]
        for fontName in fontNames {
            registerFont(withFilenameString: fontName)
        }
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
