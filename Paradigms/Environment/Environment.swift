//
//  Environment.swift
//  Paradigms
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import Foundation

struct Environment {
    
    var date: () -> Date = Date.init
}

var Env = Environment()
