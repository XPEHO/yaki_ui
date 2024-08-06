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

final class InputTextTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        // Setup landscape mode
        XCUIDevice.shared.orientation = .portrait
        
        // Load custom fonts for snapshots
        let fontNames = ["Raleway-Medium.ttf", "Roboto-Regular.ttf"]
        for fontName in fontNames {
            registerFont(withFilenameString: fontName)
        }
    }

    // Snapshot test (Like golden test in flutter)
    func testInputTextSnapshot() {
        var inputTextView = InputTextView()
        
        // Load eye icon for snapshots
        if let eyeIconUIImage = loadImageFromTestAssets(named: "Eye") {
            let eyeIconImage = Image(uiImage: eyeIconUIImage)
            inputTextView.eyeIcon = eyeIconImage
        }
        
        // Load base icon for snapshots
        if let baseIconUIImage = loadImageFromTestAssets(named: "Briefcase") {
            let baseIconImage = Image(uiImage: baseIconUIImage)
            inputTextView.baseIcon = baseIconImage
        }

        let viewController = inputTextView.toViewController()

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
