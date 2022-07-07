//
//  DateViewControllerSnapshotTests.swift
//  SnapshotsTests
//
//  Created by Peter K on 07.07.2022.
//

import XCTest
import FBSnapshotTestCase
@testable import Snapshots

class DateViewControllerSnapshotTests: FBSnapshotTestCase {
    
    var sut: DateViewController!
    
    override func setUp() {
        super.setUp()
        
        fileNameOptions = [
            .OS,
            .device,
            .screenScale,
            .screenSize
        ]
        
        sut = DateViewController()
        
        //recordMode = true
    }

    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }

    func testDateViewController() {
        sut.overrideUserInterfaceStyle = .light
        FBSnapshotVerifyViewController(sut, identifier: nil, perPixelTolerance: 0.00, overallTolerance: 0.05)
    }
    
    func testDateViewControllerDarkMode() {
        sut.overrideUserInterfaceStyle = .dark
        FBSnapshotVerifyViewController(sut, identifier: nil, perPixelTolerance: 0.00, overallTolerance: 0.05)
    }

}
