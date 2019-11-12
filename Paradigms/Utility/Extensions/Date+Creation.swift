//
//  Date+Creation.swift
//  Paradigms
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import Foundation

extension Date {
    
    init(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil, millisecond: Int? = nil, timeZone: TimeZone? = nil) {
        
        let now = Date()
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: now)
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.nanosecond = 1000000 * (millisecond ?? 0)
        
        if let timeZone = timeZone {
            dateComponents.timeZone = timeZone
        }
        
        guard let date = Calendar.current.date(from: dateComponents) else {
            fatalError("Failed to construct date")
        }
        
        self.init(timeInterval: 0, since: date)
    }
    
    func date(with components: Set<Calendar.Component>, timeZone: TimeZone?) -> Date {
        
        var componentsToSet = Calendar.current.dateComponents(components, from: self)
        componentsToSet.timeZone = timeZone
        
        guard let date = Calendar.current.date(from: componentsToSet) else {
            fatalError("Failed to create date from sub-set of components")
        }
        
        return date
    }
}
