//
//  ViewControllerTest.swift
//  SnapshotsTests
//
//  Created by Peter K on 07.07.2022.
//

import XCTest
import SnapshotTesting
@testable import Snapshots

class ViewControllerTest: XCTestCase {
    
    var sut: ViewController!

    override func setUp() {
        super.setUp()
        
        sut = ViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testViewController() {
        sut.overrideUserInterfaceStyle = .light
        assertSnapshot(matching: sut, as: .image(on: .iPhone12(.portrait)))
        assertSnapshot(matching: sut, as: .image(on: .iPhone8(.portrait)))

    }
    
    func testViewControllerDarkMode() {
        sut.overrideUserInterfaceStyle = .dark
        assertSnapshot(matching: sut, as: .image(on: .iPhone12(.portrait)))
        assertSnapshot(matching: sut, as: .image(on: .iPhone8(.portrait)))
    }

}
