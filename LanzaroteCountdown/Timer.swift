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
    var totalDays = 0
    
    func initTimer() {
        _computeDateTime()
        var classTimer = Timer()
    
        classTimer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(CountdownTimer._computeDateTime), userInfo: nil, repeats: true)
    }
    
    dynamic func _computeDateTime() {
        let components = Date.getFormattedTimeDifferenceToToday(otherDate: "04-09-2017 04:45", dateFormat: "MM-dd-yyyy hh:mm")
       
        if let s = components.second {
            self.second = s
        } else {
            self.second = 0
        }
        
        if let m = components.minute {
            self.minute = m
        } else {
            self.minute = 0
        }
        
        if let h = components.hour {
            self.hour = h
        } else {
            self.hour = 0
        }
        
        if let d = components.day {
            self.day = d
        } else {
            self.day = 0
        }
        
        if let m = components.month {
            self.month = m
        } else {
            self.month = 0
        }
        if let y = components.year {
            self.year = y
        } else {
            self.year = 0
        }
        
        totalDays = Date.getDaysDifferenceToToday(otherDate: "04-09-2017 04:45", dateFormat: "MM-dd-yyyy hh:mm")
    }
}
