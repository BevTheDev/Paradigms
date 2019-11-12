//
//  DateTests.swift
//  ParadigmsTests
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import XCTest

@testable import Paradigms

class DateTests: BaseTestCase {
    
    var testVC: DateExamplesViewController!
    
    override func setUp() {
        
        super.setUp()
        
        testVC = DateExamplesViewController()
        testVC.loadView()
    }

    func testEnvironmentDate() {
        
        testVC.viewDidLoad()
        
        XCTAssertEqual(testVC.friendlyFormatLabel.text, "11/12/2019")
        XCTAssertEqual(testVC.isoFormatLabel.text, "2019-11-12T8:45:00.000Z")
    }
}
