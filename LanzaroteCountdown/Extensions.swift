//
//  Extensions.swift
//  LanzaroteCountdown
//
//  Created by Dirk Boller on 13.10.16.
//  Copyright © 2016 Dirk Boller. All rights reserved.
//

import Foundation

extension Date {
    static func getFormattedTimeDifferenceToToday(otherDate: String, dateFormat: String) -> DateComponents {
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        
        if dateFormat == "" {
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        } else {
            dateFormatter.dateFormat = dateFormat
        }
        
        let relDate = dateFormatter.date(from: otherDate)
        
        let diffTime = Calendar.current.dateComponents([.hour,.minute,.second,.day,.month], from: todaysDate, to: relDate!)
        return diffTime
    }
    
    static func getDaysDifferenceToToday(otherDate: String, dateFormat: String) -> Int {
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        
        if dateFormat == "" {
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        } else {
            dateFormatter.dateFormat = dateFormat
        }
        
        let relDate = dateFormatter.date(from: otherDate)
        
        var td = Date().timeIntervalSince(relDate!)
        if td < 0 {
            td = -td
        }
        td = td / 3600 / 24
        return Int(td)
    }
}
