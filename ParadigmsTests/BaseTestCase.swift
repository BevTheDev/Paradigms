//
//  BaseTestCase.swift
//  ParadigmsTests
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import XCTest

@testable import Paradigms

class BaseTestCase: XCTestCase {

    // MARK: - SetUp / TearDown

    override func setUp() {
        
        super.setUp()
        
        Env = .mock
    }
}
