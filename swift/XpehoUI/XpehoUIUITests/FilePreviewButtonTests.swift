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

final class FilePreviewButtonTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait

        // Load custom fonts for snapshots
        let fontNames = ["Raleway-Regular.ttf", "Rubik-SemiBold.ttf"]
        for fontName in fontNames {
            registerFont(withFilenameString: fontName)
        }
    }

    // Snapshot test (Like golden test in flutter)
    func testFilePreviewButtonSnapshot() {
        var filePreviewButtonView = FilePreviewButtonView()
        
        // Load placeholder picture for snapshots
        if let placeholderUIImage = loadImageFromTestAssets(named: "Placeholder") {
            let placeholderImage = Image(uiImage: placeholderUIImage)
            filePreviewButtonView.imagePreview = placeholderImage
        }
        
        // Load arrow icon for snapshots
        if let arrowIconUIImage = loadImageFromTestAssets(named: "Arrow-right") {
            let arrowIconImage = Image(uiImage: arrowIconUIImage)
            filePreviewButtonView.arrowRight = arrowIconImage
        }

        let viewController = filePreviewButtonView.toViewController()

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

    // Load image from test assets
    func loadImageFromTestAssets(named imageName: String) -> UIImage? {
        // Charger l'image depuis le bundle de test
        let bundle = Bundle(for: type(of: self))
        return UIImage(named: imageName, in: bundle, compatibleWith: nil)
    }
}
