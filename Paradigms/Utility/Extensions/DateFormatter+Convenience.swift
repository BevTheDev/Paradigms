//
//  DateFormatter+Convenience.swift
//  Paradigms
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import Foundation

enum DateFormat: String {
    
    case sssXXXXX = "yyyy-MM-dd'T'H:mm:ss.SSSXXXXX"
    case ssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
    case mmddyy = "MM/dd/yyyy"
}

extension DateFormatter {
    
    convenience init(withFormat format: String) {
        self.init()
        self.dateFormat = format
    }
    
    static let iso8601: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = DateFormat.sssXXXXX.rawValue
        
        return dateFormatter
    }()
    
    static let monthDayYear: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = DateFormat.mmddyy.rawValue
        
        return dateFormatter
    }()
}
