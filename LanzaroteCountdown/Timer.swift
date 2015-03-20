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
    var kFlightDate = NSCalendar.currentCalendar().dateWithEra(1, year: 2015, month: 3, day: 29, hour: 8, minute: 35, second: 0, nanosecond: 0)
    
    func initTimer() {
        _computeDateTime()
        var classTimer = NSTimer()
    
        classTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: Selector("_computeDateTime"), userInfo: nil, repeats: true)
    }
    
    dynamic func _computeDateTime() {
        let nowDate = NSDate()
        
        let components = NSCalendar.currentCalendar().components(.CalendarUnitSecond |
            .CalendarUnitMinute | .CalendarUnitHour | .CalendarUnitDay |
            .CalendarUnitMonth | .CalendarUnitYear, fromDate: nowDate,
            toDate: kFlightDate!, options: nil)
        
        self.second = components.second
        self.minute = components.minute
        self.hour = components.hour
        self.day = components.day
        self.month = components.month
        self.year = components.year
    }

}