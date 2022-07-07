//
//  SnapshotsTests.swift
//  SnapshotsTests
//
//  Created by Peter K on 07.07.2022.
//

import XCTest
import FBSnapshotTestCase
@testable import Snapshots

class SnapshotsTests: FBSnapshotTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        
        fileNameOptions = [
            .OS,
            .device,
            .screenScale,
            .screenSize
        ]
        
        sut = ViewController()
        
        usesDrawViewHierarchyInRect = true
        
        //recordMode = true
    }

    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }

    func testViewController() {
        sut.overrideUserInterfaceStyle = .light
        FBSnapshotVerifyViewController(sut)
    }
    
    func testViewControllerDarkMode() {
        sut.overrideUserInterfaceStyle = .dark
        FBSnapshotVerifyViewController(sut)
    }

}
