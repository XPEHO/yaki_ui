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

final class CollapsableCardTests: XCTestCase {

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
    func testCollapsableCardSnapshot() {
        var collapsableCardView = CollapsableCardView()
        
        // Load qvst icon for snapshots
        if let qvstIconUIImage = loadImageFromTestAssets(named: "QVST") {
            let qvstIconImage = Image(uiImage: qvstIconUIImage)
            collapsableCardView.qvstIcon = qvstIconImage
        }
        
        // Load newsletter icon for snapshots
        if let newsletterIconUIImage = loadImageFromTestAssets(named: "Newsletter") {
            let newsletterIconImage = Image(uiImage: newsletterIconUIImage)
            collapsableCardView.newsletterIcon = newsletterIconImage
        }
        
        // Load birthday icon for snapshots
        if let birthdayIconUIImage = loadImageFromTestAssets(named: "Birthday") {
            let birthdayIconImage = Image(uiImage: birthdayIconUIImage)
            collapsableCardView.birthdayIcon = birthdayIconImage
        }
        
        // Load base icon for snapshots
        if let baseIconUIImage = loadImageFromTestAssets(named: "Briefcase") {
            let baseIconImage = Image(uiImage: baseIconUIImage)
            collapsableCardView.baseIcon = baseIconImage
        }
        
        // Load chevronUp icon for snapshots
        if let chevronUpIconUIImage = loadImageFromTestAssets(named: "Chevron-up") {
            let chevronUpIconImage = Image(uiImage: chevronUpIconUIImage)
            collapsableCardView.chevronUpIcon = chevronUpIconImage
        }
        
        // Load chevronDown icon for snapshots
        if let chevronDownIconUIImage = loadImageFromTestAssets(named: "Chevron-down") {
            let chevronDownIconImage = Image(uiImage: chevronDownIconUIImage)
            collapsableCardView.chevronDownIcon = chevronDownIconImage
        }

        let viewController = collapsableCardView.toViewController()

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
