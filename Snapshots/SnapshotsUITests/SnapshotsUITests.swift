//
//  SnapshotsUITests.swift
//  SnapshotsUITests
//
//  Created by Peter K on 07.07.2022.
//

import XCTest
import FBSnapshotTestCase

class SnapshotsUITests: FBSnapshotTestCase {
    
    let app = XCUIApplication()
    
    func verifyView(identifier: String, perPixelTolerance: CGFloat = 0.00, overallTolerance: CGFloat = 0.05) {
        
        guard let screenshotWithoutStatusBar = app.screenshot().image.removingStatusBar else {
            return XCTFail("An error occurred while cropping the screenshot", file: #file, line: #line)
        }
        
        FBSnapshotVerifyView(
            UIImageView(image: screenshotWithoutStatusBar),
            identifier: identifier,
            perPixelTolerance: perPixelTolerance,
            overallTolerance: overallTolerance
        )
    }
    
    func verifyElement(element: XCUIElement,identifier: String) {
        
        FBSnapshotVerifyView(UIImageView(image: element.screenshot().image), identifier: identifier)
    }
    
    override func setUp() {
        super.setUp()
        app.launch()
        
        fileNameOptions = [
            .OS,
            .device,
            .screenScale,
            .screenSize,
        ]
        
        //recordMode = true
    
    }


    func testTapButton() {
        app.buttons["TapButton"].waitForExistence(timeout: 5)
        verifyElement(element: app.buttons["TapButton"].firstMatch, identifier: "imageTapButton")
    }
    
    func testTapButtonDarkMode() {
        app.launchArguments.append("UITestingDarkModeEnabled")
        app.launch()
        app.buttons["TapButton"].waitForExistence(timeout: 5)
        verifyElement(element: app.buttons["TapButton"].firstMatch, identifier: "imageTapButton")
    }
    
    func testDateViewController() {
        app.buttons["TapButton"].waitForExistence(timeout: 5)
        app.buttons["TapButton"].tap()
        Thread.sleep(forTimeInterval: 2)
        verifyView(identifier: "imageDateViewController")
    }
    
    func testDateViewControllerDarkMode() {
        app.launchArguments.append("UITestingDarkModeEnabled")
        app.launch()
        app.buttons["TapButton"].waitForExistence(timeout: 5)
        app.buttons["TapButton"].tap()
        Thread.sleep(forTimeInterval: 2)
        verifyView(identifier: "imageDateViewController")
    }
    
    func testViewController() {
        verifyView(identifier: "imageViewController")
    }
    
    func testViewControllerDarkMode() {
        app.launchArguments.append("UITestingDarkModeEnabled")
        app.launch()
        verifyView(identifier: "imageViewController")
    }
    
}
