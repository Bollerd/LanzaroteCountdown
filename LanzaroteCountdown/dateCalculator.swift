//
//  dateCalculator.swift
//  LanzaroteCountdown
//
//  Created by Dirk Boller on 15.03.15.
//  Copyright (c) 2015 Dirk Boller. All rights reserved.
//

import Foundation



class dateCalculator {
    extension NSDate {
        func yearsFrom(date:NSDate) -> Int{
            return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitYear, fromDate: date, toDate: self, options: nil).year
        }
        func monthsFrom(date:NSDate) -> Int{
            return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMonth, fromDate: date, toDate: self, options: nil).month
        }
        func weeksFrom(date:NSDate) -> Int{
            return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitWeekOfYear, fromDate: date, toDate: self, options: nil).weekOfYear
        }
        func daysFrom(date:NSDate) -> Int{
            return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: date, toDate: self, options: nil).day
        }
        func hoursFrom(date:NSDate) -> Int{
            return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitHour, fromDate: date, toDate: self, options: nil).hour
        }
        func minutesFrom(date:NSDate) -> Int{
            return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMinute, fromDate: date, toDate: self, options: nil).minute
        }
        func secondsFrom(date:NSDate) -> Int{
            return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitSecond, fromDate: date, toDate: self, options: nil).second
        }
        func offsetFrom(date:NSDate) -> String {
            if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
            if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
            if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
            if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
            if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
            if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
            return ""
        }
    }
    
    class func getDateDifference() -> String {
        extension NSDate {
            func yearsFrom(date:NSDate) -> Int{
                return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitYear, fromDate: date, toDate: self, options: nil).year
            }
            func monthsFrom(date:NSDate) -> Int{
                return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMonth, fromDate: date, toDate: self, options: nil).month
            }
            func weeksFrom(date:NSDate) -> Int{
                return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitWeekOfYear, fromDate: date, toDate: self, options: nil).weekOfYear
            }
            func daysFrom(date:NSDate) -> Int{
                return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: date, toDate: self, options: nil).day
            }
            func hoursFrom(date:NSDate) -> Int{
                return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitHour, fromDate: date, toDate: self, options: nil).hour
            }
            func minutesFrom(date:NSDate) -> Int{
                return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMinute, fromDate: date, toDate: self, options: nil).minute
            }
            func secondsFrom(date:NSDate) -> Int{
                return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitSecond, fromDate: date, toDate: self, options: nil).second
            }
            func offsetFrom(date:NSDate) -> String {
                if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
                if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
                if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
                if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
                if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
                if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
                return ""
            }
        }
        
        let flightDate = NSCalendar.currentCalendar().dateWithEra(1, year: 2015, month: 3, day: 29, hour: 8, minute: 35, second: 0, nanosecond: 0)
        //let nowDate = NSDate()
        let nowDate = NSCalendar.currentCalendar().dateWithEra(1, year: 2015, month: 3, day: 29, hour: 8, minute: 35, second: 0, nanosecond: 0)
        
        let years = flightDate.yearsFrom(nowDate)
        let months = flightDate.monthsFrom(nowDate)
        let weeks = flightDate.weeksFrom(nowDate)
        let days = flightDate.daysFrom(nowDate)
        let hours = flightDate.hoursFrom(nowDate)
        let minutes = flightDate.minutesFrom(nowDate)
        let seconds = flightDate.secondsFrom(nowDate)
    }
}