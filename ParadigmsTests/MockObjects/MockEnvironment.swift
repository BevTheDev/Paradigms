//
//  MockEnvironment.swift
//  ParadigmsTests
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import Foundation
import XCTest

@testable import Paradigms

extension Environment {
    
    static let mock = Environment(
        date: Date(year: 2019, month: 11, day: 12, hour: 2, minute: 45, second: 0, millisecond: 0, timeZone: TimeZone.init(abbreviation: "CST"))
    )
}
