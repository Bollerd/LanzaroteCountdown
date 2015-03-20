//
//  Timer.swift
//  LanzaroteCountdown
//
//  Created by Dirk Boller on 20.03.15.
//  Copyright (c) 2015 Dirk Boller. All rights reserved.
//

import Foundation

class CountdownTimer {
    var year = 0
    var month = 0
    var day = 0
    var hour = 0
    var minute = 0
    var second = 0
    
    func initTimer(){
        var timer = NSTimer()
    
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: Selector("computeDateTime"), userInfo: nil, repeats: true)
    }
    
    func computeDateTime() {
        let flightDate = NSCalendar.currentCalendar().dateWithEra(1, year: 2015, month: 3, day: 29, hour: 8, minute: 35, second: 0, nanosecond: 0)
        let nowDate = NSDate()
        
        let components = NSCalendar.currentCalendar().components(.CalendarUnitSecond |
            .CalendarUnitMinute | .CalendarUnitHour | .CalendarUnitDay |
            .CalendarUnitMonth | .CalendarUnitYear, fromDate: nowDate,
            toDate: flightDate!, options: nil)
        
        self.second = components.second
        self.minute = components.minute
        self.hour = components.hour
        self.day = components.day
        self.month = components.month
        self.year = components.year
    }
}