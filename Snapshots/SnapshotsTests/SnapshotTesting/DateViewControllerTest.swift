//
//  DateViewController.swift
//  SnapshotsTests
//
//  Created by Peter K on 07.07.2022.
//

import XCTest
import SnapshotTesting
@testable import Snapshots

class DateViewControllerTest: XCTestCase {

    var sut: DateViewController!

    override func setUp() {
        super.setUp()
        
        sut = DateViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testViewController() {
        sut.overrideUserInterfaceStyle = .light
        assertSnapshot(matching: sut, as: .image(on: .iPhone12(.portrait), precision: 0.05))
        assertSnapshot(matching: sut, as: .image(on: .iPhone8(.portrait), precision: 0.05))

    }
    
    func testViewControllerDarkMode() {
        sut.overrideUserInterfaceStyle = .dark
        assertSnapshot(matching: sut, as: .image(on: .iPhone12(.portrait), precision: 0.05))
        assertSnapshot(matching: sut, as: .image(on: .iPhone8(.portrait), precision: 0.05))
    }

}
